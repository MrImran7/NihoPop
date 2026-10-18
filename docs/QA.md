# Android physical QA
Use the APK from a successful Android Actions run. Record device, Android version,
commit and result for each check.
1. Launch in airplane mode. Home and lesson must work without network.
2. Start lesson; read the introduction. Check cannot be pressed without a choice.
3. Choose a wrong answer. Read the correct explanation; repeated taps must not
   count extra answers. Finish greetings (four questions), then each hiragana lesson (ten questions each).
4. Confirm the final score and saved status. Return home; completion is displayed.
5. Confirm each lesson has its own score; existing greetings and vowel scores must survive
   an upgrade to this build. Complete the K and S rows without changing earlier progress.
   Force-stop and reopen. Completion and best score must remain.
6. Replay with a lower score. Best score must not decrease.
7. Leave a partially completed replay with Android Back. Best score is unchanged.
8. Increase system font size; test a small display and landscape. All options and
   action buttons must be reachable by scrolling; Japanese glyphs must render.
9. With TalkBack, navigate choices and buttons and check feedback announcements.
10. Scroll to the K and S row cards. Read their teaching screens and check that
    し is taught as shi. All ten questions in each lesson must be reachable.
11. Clear app data: progress should reset. No account is needed.

Automated coverage: duplicate submissions, unanswered progression, mixed scoring,
zero-score completion, best-score preservation, lesson score isolation, catalog validity, and all four complete lesson UI flows. K and S row tests use a phone-sized viewport.
Audio, reminders and release signing are outside this milestone.
