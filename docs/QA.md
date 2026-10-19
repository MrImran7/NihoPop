# Android physical QA

Use the APK from a successful Actions run. Record device, Android version and commit.
Install as an update over the existing app to check saved progress.

## Focused checks for the full hiragana course
1. Open offline. Check all previously saved greetings/vowel/row scores remain.
2. Use Lesson group to select Basic hiragana, Voiced sounds, Combined sounds and
   Reading rules. Each list must show the matching lessons; All lessons restores the catalog.
3. Read the wa/wo/n and d-row teaching screens. Check kana and diacritics render.
   Compare full-sized や/ゆ/よ/つ with small ゃ/ゅ/ょ/っ on the device.
4. Complete one short lesson (ya/yu/yo), one combined-sound lesson and one reading-rule
   lesson. Check their totals are 6, 12 and 6 respectively. Return and reopen.
5. Increase system font size, use landscape, and scroll a long teaching screen.
   Every control must remain reachable. Starting practice and advancing a question
   should return to the top; the question must not be hidden by the previous scroll.
6. Use Android Back during a replay. Saved best scores must stay unchanged.
7. Use TalkBack to navigate the group selector, choices and feedback.

## Regression checklist
- Wrong answers show explanations; repeated taps do not increase scores.
- Check answer stays disabled until a choice is made.
- Lower replay scores do not reduce the best.
- Force-stop/reopen preserves each lesson independently.
- Clear app data only after upgrade testing: all progress resets.

Automation covers every complete lesson flow, independent progress, reopening,
catalog completeness, valid choices, scoring, group filtering and abandoned attempts.
Most flows run at a phone-sized viewport. Physical checks focus on actual fonts,
touch, accessibility and OS persistence; rerunning every question manually is unnecessary.

## Mistake review
Finish a lesson with at least two mistakes. Tap Review mistakes and check only
missed questions appear. Correct one and miss the other, then use Review remaining
mistakes: only that question should remain. Finish it and return home; the original
lesson best must be unchanged. A perfect lesson should not offer mistake review.
Leaving review with Android Back preserves the saved lesson score; the review queue
is intentionally not restored after closing the lesson or app.
