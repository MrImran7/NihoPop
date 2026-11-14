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

## Katakana update
1. Install over the current app. Verify previous hiragana best scores remain.
2. Select each Katakana group. Open a lesson and return: the selected group remains.
   All lessons must still include greetings and hiragana.
3. Inspect シ/ツ, ソ/ン, small ャ/ュ/ョ/ッ, dakuten/circles and ー with normal
   and enlarged text. Check every control remains reachable in landscape.
4. Complete one katakana lesson with a mistake. Review it; the original katakana
   best stays unchanged and no hiragana score changes.
5. Force-stop and reopen. Katakana completion and best score persist separately.
6. Try a loanword or reading-rule lesson and verify the correct label and explanation.

Automated tests cover all 27 katakana lesson flows at a phone-sized viewport,
separate scores, mistake review, catalog coverage and picker navigation. A full
manual replay of all exercises is unnecessary.

## Vocabulary update
1. Install over the current app and confirm earlier hiragana/katakana scores remain.
2. Choose Vocabulary basics. The eight topic cards must show Japanese ↔ English.
3. Open Places. Read the six words; confirm kanji have kana readings, including
   学校（がっこう）, 病院（びょういん） and 図書館（としょかん）.
4. Complete any vocabulary lesson, deliberately missing one answer. Review mistakes:
   only missed questions return, readings remain visible, and the saved best is unchanged.
5. Force-stop/reopen and verify the vocabulary score persists independently.
6. With enlarged system text and TalkBack, check readings, long choices such as
   Cooked rice / meal, feedback and controls. Also try landscape.

7. Open Everyday actions and check the dictionary-form explanation. Compare
   来る（くる） with 行く（いく）. Open Colours and check 黄色（きいろ）.

Automated tests cover all 96 vocabulary exercises, independent scores, review and picker
navigation. Physical testing need not repeat every word.

## Word bank
1. Open Word bank using the book icon in the home toolbar. In airplane mode,
   search for 図書館, としょかん and LIBRARY; each should find the library entry.
2. Select a topic, enter a word from another topic, and check the no-matches
   message. Clear search keeps the topic; Reset filters restores all 48 words.
3. Open a result's lesson, then press Android Back. The search and topic remain.
   Browsing alone must not mark any lesson completed.
4. With the keyboard open, enlarged system text and landscape orientation, scroll
   to a result and open its lesson. Check Japanese readings and controls with TalkBack.
5. Finish a linked lesson, return to the word bank, then return home and force-stop.
   On reopening, its score remains saved independently from existing scores.

## Flashcards
1. In Word bank, filter to Food and drink and search rice. Practise flashcards
   must open one card for ご飯（ごはん）. The keyboard should close.
2. Use TalkBack: the answer should be absent until Reveal answer is activated.
   The revealed answer should be announced; Next card/Finish practice then enables.
3. Switch to English → Japanese. Check the answer is hidden again, then reveal
   the Japanese spelling with its kana reading.
4. Use enlarged system text in portrait and landscape. Scroll to reach reveal,
   next/finish and restart controls.
5. Finish and return to Word bank: the search and topic remain. Leave another
   deck midway with Android Back. Existing lesson scores must remain unchanged.

## Saved words
1. Save words from two topics. Force-stop and reopen the app, then open Word bank
   and enable Saved words only: both should remain.
2. Combine Saved words only with a topic/search. Practise flashcards should use
   only those results; Back preserves the filters.
3. Remove a saved word, reopen, and verify it stays removed. Reset filters must
   restore the full list without deleting other saved words.
4. With an empty saved list, check the guidance and disabled flashcard button.
5. Use TalkBack and enlarged text in landscape to find and activate Save word /
   Remove saved word. Previous kana/vocabulary scores must remain unchanged.

## Grammar basics
1. Install as an update. Existing kana/vocabulary scores and saved words should remain.
2. Choose Grammar basics. Five lesson cards should show Sentence practice.
3. Read Statements and Negatives: check は, じゃないです and ではありません render clearly.
4. Complete one lesson with a mistake. Review mistakes, return, force-stop and reopen:
   the original lesson score must persist and other scores must remain unchanged.
5. Use Questions with enlarged system text and in landscape. Long sentence choices,
   explanations and all controls must remain readable/reachable.
6. With TalkBack, check Japanese sentences, choices and feedback. Browse the word bank
   and start a saved-word flashcard deck as a regression check.
