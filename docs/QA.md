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
2. Choose Grammar basics. Twenty-two lesson cards should show Sentence practice.
3. Read Statements and Negatives: check は, じゃないです and ではありません render clearly.
4. Complete one lesson with a mistake. Review mistakes, return, force-stop and reopen:
   the original lesson score must persist and other scores must remain unchanged.
5. Use Questions with enlarged system text and in landscape. Long sentence choices,
   explanations and all controls must remain readable/reachable.
6. With TalkBack, check Japanese sentences, choices and feedback. Browse the word bank
   and start a saved-word flashcard deck as a regression check.

## Action grammar extension
1. Open Polite actions. Check the six verb pairs, particularly くる → きます,
   and the distinction between ます and ません.
2. Try Objects with を and Where actions happen with で. Check the longer choices
   at enlarged text sizes and in landscape.
3. Complete one new lesson with a mistake and review it. Reopen the app: the new
   score should persist while the first five grammar scores and saved words remain.

## Destinations, times and past actions
1. Open the three new grammar lessons. Check に／へ, はちじ／くじ and the longer
   ませんでした endings render clearly on your device.
2. With large system text and landscape orientation, complete Past actions.
   Check long answers and feedback remain reachable.
3. Complete one new lesson with a mistake and review it. Force-stop/reopen:
   its score and all previous grammar scores/bookmarks must remain unchanged.

### Noun past and adjective extension
- In Grammar basics, complete the past noun, い-adjective and な-adjective lessons (8 questions each).
- Check でした versus verb ました, noun past negatives and polite replies.
- Check くないです, direct い-adjective + noun, and な before nouns for な-adjectives including きれい.
- At enlarged font size, scroll the な-adjective introduction and longest comparison choices; confirm no clipping.
- Reopen the app: new scores remain; earlier kana, vocabulary and grammar scores and saved words remain intact.
- Replay with a mistake and review it; confirm review does not overwrite the saved lesson best.

### Existence and location extension
- Complete “Grammar: what is there?” and “Grammar: where is it?” (8 questions each).
- Check things use あります and people/cats use います; check both negative forms.
- Check on/under the desk and inside the box, plus どこ questions and answers.
- Enlarge system text and verify the long introduction and topic-comparison question can be scrolled without clipping.
- Reopen after completion: both new scores and all previous progress/bookmarks remain.

### Past descriptions and mixed review
- Complete “Grammar: past descriptions” and “Grammar: mixed review” (8 questions each).
- Check past affirmative/negative forms for both adjective types, including きれい.
- With enlarged text, scroll the mixed-review introduction and long sentence choices.
- Make a mistake in the mixed review and retry it through Review mistakes; verify the original best score remains.
- Restart the app and verify both new scores and all earlier scores/bookmarks remain.

### Preferences and invitations
- Complete “Grammar: things you like” and “Grammar: invitations and suggestions” (8 questions each).
- Check preference questions, negative preferences and あまり + negative meaning.
- Check invitation versus suggestion, acceptance, and the contextual polite refusal.
- Enlarge text: verify the long invitation introduction and reply choices scroll without clipping.
- Reopen after completion and check both new scores, earlier scores and saved words.

### Wants: things and actions
- Complete “Grammar: things you want” and “Grammar: things you want to do” (8 questions each).
- Check ほしい versus たい, their negatives, and the friend/gift/planning contexts.
- Verify the final action-wish question accepts the statement that both を and が can be used in the water example.
- Enlarge text and scroll the action-wish introduction and long comparison choices without clipping.
- Reopen the app: confirm new scores, earlier lesson scores and saved words remain.

## Mixed grammar practice (feature/grammar-practice)
1. Install the new APK as an update. Check earlier scores and saved words remain.
2. Open Grammar practice using the shuffle toolbar icon. Without completed grammar lessons, both start buttons must be disabled with guidance.
3. Complete two or more grammar lessons; return to practice. Start mixed practice and finish, deliberately missing two questions.
4. Check the result and saved mistake count. Force-stop and reopen offline; Review saved mistakes must contain only unresolved practice mistakes.
5. Correct one mistake and miss the other. Finish and reopen: only the remaining mistake should stay. Complete it correctly and confirm the empty state.
6. Start another practice session, answer a question and leave before completing. Saved mistakes and lesson scores must stay unchanged.
7. Check Japanese text and long answers at large system font sizes and in landscape. With TalkBack, identify the shuffle button, both practice actions, feedback and return button.
8. Confirm regular lesson review, word bank, bookmarks and flashcards still work. Practice should never mark a lesson complete or replace its best score.

Automated coverage: topic-balanced sampling, duplicate prevention, completed-only pool,
persistent mistakes, partial review, stale IDs, empty state, phone/enlarged-text session,
abandonment, save retry and immediate review. Hardware/OS checks above remain manual.
