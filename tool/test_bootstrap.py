"""Bootstrap regression tests; no Flutter/Android SDK is needed."""
import pathlib
import tempfile
import unittest
from unittest import mock

import bootstrap


class BootstrapTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = pathlib.Path(temporary.name)
        self.android = self.root / "android"

    def test_existing_host_preserves_custom_files_and_is_repeatable(self):
        self.android.mkdir()
        custom = self.android / "build.gradle.kts"
        custom.write_text("// local Gradle setup\n", encoding="utf-8")
        properties = self.android / "gradle.properties"
        properties.write_text("android.useAndroidX=true", encoding="utf-8")
        with mock.patch.object(bootstrap.subprocess, "run") as run:
            bootstrap.bootstrap(self.root)
            first = properties.read_bytes()
            bootstrap.bootstrap(self.root)
            run.assert_not_called()
        self.assertEqual(properties.read_bytes(), first)
        self.assertEqual(first, b"android.useAndroidX=true\nkotlin.incremental=false\n")
        self.assertEqual(custom.read_text(), "// local Gradle setup\n")

    def test_replaces_duplicates_preserving_comments_and_windows_newlines(self):
        self.android.mkdir()
        properties = self.android / "gradle.properties"
        properties.write_bytes(
            b"# kotlin.incremental=true\r\n"
            b"org.gradle.jvmargs=-Xmx4G\r\n"
            b"kotlin.incremental=true\r\n"
            b"  kotlin.incremental : true\r\n"
            b"kotlin.incremental.useClasspathSnapshot=true\r\n"
        )
        bootstrap.configure_gradle(self.android)
        expected = (
            b"# kotlin.incremental=true\r\n"
            b"org.gradle.jvmargs=-Xmx4G\r\n"
            b"kotlin.incremental=false\r\n"
            b"kotlin.incremental.useClasspathSnapshot=true\r\n"
        )
        self.assertEqual(properties.read_bytes(), expected)
        bootstrap.configure_gradle(self.android)
        self.assertEqual(properties.read_bytes(), expected)

    def test_missing_properties_are_created(self):
        self.android.mkdir()
        bootstrap.configure_gradle(self.android)
        self.assertEqual((self.android / "gradle.properties").read_text(),
                         "kotlin.incremental=false\n")

    def test_new_host_uses_resolved_flutter_and_applies_configuration(self):
        def create_host(command, check):
            self.assertTrue(check)
            target = pathlib.Path(command[-1])
            manifest = target / "android/app/src/main/AndroidManifest.xml"
            manifest.parent.mkdir(parents=True)
            manifest.write_text('<application android:label="nihopop"/>', encoding="utf-8")
            (target / "android/gradle.properties").write_text(
                "android.useAndroidX=true\n", encoding="utf-8")

        with mock.patch.object(bootstrap.shutil, "which", return_value="D:/flutter/bin/flutter.bat"), \
                mock.patch.object(bootstrap.subprocess, "run", side_effect=create_host) as run:
            bootstrap.bootstrap(self.root)
        self.assertEqual(run.call_args.args[0][0], "D:/flutter/bin/flutter.bat")
        self.assertIn("--platforms=android", run.call_args.args[0])
        self.assertIn('android:label="NihoPop"',
                      (self.android / "app/src/main/AndroidManifest.xml").read_text())
        self.assertIn("kotlin.incremental=false",
                      (self.android / "gradle.properties").read_text())

    def test_already_configured_file_is_not_rewritten(self):
        self.android.mkdir()
        properties = self.android / "gradle.properties"
        properties.write_bytes(b"kotlin.incremental=false\n")
        with mock.patch.object(pathlib.Path, "write_bytes") as write:
            bootstrap.configure_gradle(self.android)
            write.assert_not_called()


if __name__ == "__main__":
    unittest.main()
