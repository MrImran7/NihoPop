"""Generate the Android host and apply shared build configuration."""
import pathlib
import re
import shutil
import subprocess
import tempfile


def configure_gradle(android):
    """Apply the Kotlin workaround once, including to an existing host."""
    properties = android / "gradle.properties"
    original = properties.read_bytes().decode("utf-8") if properties.exists() else ""
    newline = "\r\n" if "\r\n" in original else "\n"
    result = []
    found = False
    for line in original.splitlines(keepends=True):
        if re.match(r"^[ \t]*kotlin\.incremental(?:[ \t]*[=:]|[ \t]+|$)", line):
            if not found:
                result.append("kotlin.incremental=false" + newline)
                found = True
        else:
            result.append(line)
    updated = "".join(result)
    if not found:
        if updated and not updated.endswith(("\n", "\r")):
            updated += newline
        updated += "kotlin.incremental=false" + newline
    if updated != original:
        properties.write_bytes(updated.encode("utf-8"))


def bootstrap(root):
    android = root / "android"
    if android.exists():
        print("Android host already exists; preserving it and applying build configuration.")
    else:
        with tempfile.TemporaryDirectory() as temporary:
            target = pathlib.Path(temporary) / "nihopop"
            flutter_cmd = shutil.which("flutter") or "flutter"
            subprocess.run([
                flutter_cmd, "create", "--platforms=android", "--org=io.github.mrimran7",
                "--project-name=nihopop", "--no-pub", str(target)
            ], check=True)
            shutil.copytree(target / "android", android)
            manifest = android / "app/src/main/AndroidManifest.xml"
            manifest.write_text(
                manifest.read_text(encoding="utf-8").replace(
                    'android:label="nihopop"', 'android:label="NihoPop"'),
                encoding="utf-8",
            )
        print("Android host created.")
    configure_gradle(android)
    print("Android build configuration ready. Run flutter pub get.")


if __name__ == "__main__":
    bootstrap(pathlib.Path(__file__).resolve().parents[1])
