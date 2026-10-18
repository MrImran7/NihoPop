# NihoPop
NihoPop — Learn Japanese. A little Japanese, every day.

Android-only Flutter foundation for learning Japanese through English. Original
greetings lesson, four multiple-choice exercises in both directions, English
feedback, replay and locally saved best score/completion. No account or server.

## Run
Install Flutter **3.24.5**, JDK 17, Python 3 and the Android SDK.
This is a fixed initial toolchain, not a claim that it is the latest Flutter.
Run `flutter doctor` and complete Android SDK license setup.

```sh
python3 tool/bootstrap.py
flutter pub get
flutter run
```

The bootstrap generates the standard Android host from the pinned Flutter SDK
without replacing application source. Only Android is generated. Its launcher
currently uses Flutter's default icon; branded artwork is a later milestone.
Generated host files are ignored until we need native customisations. Commit
those files and stop regenerating them when that milestone arrives.

## Verify and build
```sh
flutter analyze --fatal-infos
flutter test
flutter build apk --debug
```

GitHub Actions runs these checks and uploads `nihopop-debug-apk`. Download and
unzip it to install the APK on a test Android device. This is a debug build,
not a Play Store release. Release signing is not configured.
Dependencies are pinned directly; transitive dependencies are not yet locked.
Commit a generated pubspec.lock once the Flutter environment is available.

## Structure
- lib/lesson.dart: original content and lesson state, independent of widgets.
- lib/progress.dart: device-local best score and completion.
- lib/main.dart: lesson list, teaching card, exercises and results.
- test/: scoring, persistence and full lesson widget regression tests.
- docs/QA.md: physical-device acceptance checks.

## Workflow
Branch from develop; PR into develop. Main is reserved for stable releases.
Do not merge automatically. Keep Android as the only supported platform.

## Scope and data
Progress stays on the device. Uninstalling or clearing data deletes it.
Leaving a lesson early discards that attempt. Completion records finishing all
questions, not mastery; best score is reported separately. Mistakes are explained
immediately. Listening, kana curriculum, typing, spaced review and cloud sync
are not implemented yet. No Duolingo code, assets or curriculum are included.
