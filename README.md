# NihoPop
NihoPop — Learn Japanese. A little Japanese, every day.

Android-only Flutter app for learning Japanese through English. The offline course
has 72 lessons: greetings, hiragana, katakana, everyday vocabulary and basic grammar.
The eight vocabulary lessons teach 48 words through 96 exercises. Eleven grammar
lessons add 88 questions, for 686 exercises across the complete app. Vocabulary covers people, food and drink, places, and
everyday objects, time, transport, colours and everyday actions; kanji words display kana readings in both directions.
It covers all 46 basic kana, 25 voiced/semi-voiced kana, 33 common contracted
combinations plus three rare d-row forms, small っ, long vowels, particles and a
reading checkpoint. Every lesson has independent saved progress and replay.
Katakana covers all 46 basics, voiced forms, combinations, selected loanword sounds,
long-vowel mark ー, small ッ and similar-shape practice.
Filter the lesson list by group to navigate either script.
Open Word bank from the home toolbar to search all 48 vocabulary words offline
by kanji, kana or English. Filter by topic and open the matching lesson; returning
keeps your search. Browsing does not mark a lesson complete.
Practise flashcards from the filtered word bank: reveal answers, switch translation
direction, and repeat the deck. Flashcards are unscored self-study; they do not
change lesson completion or best scores.
Save words in the word bank to build a personal list. Saved words only combines
with search and topic filters, including for flashcards. Bookmarks stay on this
device after reopening; removing a bookmark leaves lesson progress unchanged.
After a saved lesson attempt, Review mistakes retries only missed questions.
Further reviews contain only the remaining mistakes. Review results never replace
lesson best scores. Review queues last only for the current session.

This milestone teaches recognition and reading through multiple-choice exercises.
Audio, handwriting/stroke-order assessment and spaced review are not implemented.
Historical ゐ/ゑ and specialist loanword extensions are outside the modern core.
Grammar basics introduces は／です statements, じゃないです negatives, possession
with の, これ／それ／あれ and polite questions with か, then introduces six polite verb pairs,
ます／ません, direct objects with を, and action locations with で. Further lessons add destinations with に／へ,
clock times with に, and polite past actions with ました／ませんでした. Teaching notes precede
sentence selection, meaning checks and particle practice using familiar vocabulary.
See [grammar scope](docs/GRAMMAR.md).

See [hiragana curriculum](docs/CURRICULUM.md) and
[katakana curriculum](docs/KATAKANA.md), plus
[vocabulary scope](docs/VOCABULARY.md), for conventions and references.

## Run
Install Flutter **3.24.5**, JDK 17, Python 3 and the Android SDK.
This is a fixed initial toolchain, not a claim that it is the latest Flutter.
Run `flutter doctor` and complete Android SDK license setup.

```sh
python3 tool/bootstrap.py
flutter pub get
flutter run
```

The bootstrap generates the standard Android host from your installed Flutter SDK
(use the pinned version above to match CI) without replacing application source. Only Android is generated. Its launcher
currently uses Flutter's default icon; branded artwork is a later milestone.
Generated host files are ignored until we need native customisations. Commit
those files and stop regenerating them when that milestone arrives.

Bootstrap also sets `kotlin.incremental=false` in `android/gradle.properties` for
both newly generated and existing hosts. This carries the local Kotlin build
workaround into repeatable project setup. It disables Kotlin incremental compilation,
which can make repeat Kotlin builds slower; it does not install dependencies or
resolve every Gradle/SDK error. Running bootstrap again updates this setting without
regenerating an existing host or duplicating the property. Other Gradle properties
and native files are preserved.

On Windows, run from the project root:
```powershell
python tool/bootstrap.py
flutter pub get
flutter build apk --debug
```
Then sync Gradle if Android Studio already has the project open.

The generated `android/` directory is ignored by Git. Switching branches in the same
checkout normally keeps it; a fresh clone/worktree needs bootstrap. Avoid deleting
it or running `git clean -fdx` if it contains local native customisations. After this
bootstrap change is merged into `develop`, create future feature branches from the
updated `develop` to inherit the fix. Branches created before that merge do not
contain it automatically. We continue using the current feature branch until then.

## Verify and build
```sh
python3 -m unittest discover -s tool -p 'test_*.py'
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
- lib/grammar.dart: eleven original beginner grammar lessons.
- lib/vocabulary.dart: eight original vocabulary lessons with kana readings.
- lib/vocabulary_words.dart: searchable reference, checked against lesson content.
- lib/word_bank.dart: offline word lookup and links to lessons.
- lib/saved_words.dart: device-local vocabulary bookmarks.
- lib/flashcards.dart: filtered, bidirectional flashcard practice.
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
immediately. Listening, handwriting, typing, spaced review and cloud sync
are not implemented yet. No Duolingo code, assets or curriculum are included.
