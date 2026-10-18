"""Generate only the Android host using the pinned Flutter SDK."""
import pathlib
import subprocess
import tempfile
import shutil

root = pathlib.Path(__file__).resolve().parents[1]
if (root / "android").exists():
    print("Android host already exists; leaving it unchanged.")
else:
    with tempfile.TemporaryDirectory() as temporary:
        target = pathlib.Path(temporary) / "nihopop"
        subprocess.run([
            "flutter", "create", "--platforms=android", "--org=io.github.mrimran7",
            "--project-name=nihopop", "--no-pub", str(target)
        ], check=True)
        shutil.copytree(target / "android", root / "android")
        manifest = root / "android/app/src/main/AndroidManifest.xml"
        manifest.write_text(
            manifest.read_text().replace('android:label="nihopop"', 'android:label="NihoPop"')
        )
    print("Android host created. Run flutter pub get.")
