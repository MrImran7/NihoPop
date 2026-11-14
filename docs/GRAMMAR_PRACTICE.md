# Grammar practice

Open the shuffle action in the home toolbar. Only completed grammar lessons are eligible.
A mixed session samples up to 10 unique questions, selecting across shuffled topics
before taking another question from the same topic. Questions reuse original answers
and explanations. No new curriculum questions are counted.

Review saved mistakes samples up to 10 unresolved practice questions. A completed
session adds missed questions and removes correctly answered questions from its
attempted set. Untouched mistakes remain. Immediate mistake review uses the same
update path. Abandoned sessions do not update history.

Practice history is device-local, stored separately from lesson completion and best
scores under grammar-practice.mistakes.v1. Question references combine the versioned
lesson ID with its exercise index. Never reorder or replace exercises within an
existing versioned lesson: use a new lesson ID when changing question identity.
Unknown or ineligible references are ignored and removed on the next successful save.

Only completed practice sessions feed this list; regular lessons retain their
existing session-only mistake review. No mastery claims, spaced repetition schedule,
cloud sync or score-based unlocking are introduced. Save failures show a retry button.

Validation runs automatically in the existing Android workflow. Physical acceptance
steps are in docs/QA.md. Keep subsequent practice improvements on this feature branch
until its agreed milestone is verified on device.
