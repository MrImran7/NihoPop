import 'package:flutter_test/flutter_test.dart';
import 'package:nihopop/lesson.dart';
import 'package:nihopop/progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('cannot skip unanswered questions or count the same answer twice', () {
    final session = LessonSession(greetings);
    session.next();
    expect(session.index, 0);
    session.submit(0);
    session.submit(0);
    expect(session.correct, 1);
    session.next();
    expect(session.index, 1);
    expect(session.answered, false);
  });

  test('mixed answers produce the expected final score', () {
    final session = LessonSession(greetings);
    for (final answer in [0, 0, 2, 0]) {
      session.submit(answer);
      session.next();
    }
    expect(session.finished, true);
    expect(session.correct, 3);
    session.next();
    expect(session.index, 4);
  });

  test('progress survives a new store and lower scores preserve the best', () async {
    SharedPreferences.setMockInitialValues({});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await store.record(greetings.id, 3);
    await store.record(greetings.id, 1);
    final reopened = ProgressStore(await SharedPreferences.getInstance());
    expect(reopened.completed(greetings.id), true);
    expect(reopened.best(greetings.id), 3);
  });

  test('zero-score completion is saved', () async {
    SharedPreferences.setMockInitialValues({});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await store.record(greetings.id, 0);
    expect(store.completed(greetings.id), true);
    expect(store.best(greetings.id), 0);
  });

  test('lesson progress is independent and lower scores keep each best', () async {
    SharedPreferences.setMockInitialValues({'best.greetings-v1': 3, 'completed.greetings-v1': true});
    final store = ProgressStore(await SharedPreferences.getInstance());
    expect(store.completed(hiraganaVowels.id), false);
    await store.record(hiraganaVowels.id, 8);
    await store.record(hiraganaVowels.id, 2);
    expect(store.best(hiraganaVowels.id), 8);
    expect(store.best(greetings.id), 3);
    expect(store.completed(greetings.id), true);
    expect(store.completed(hiraganaVowels.id), true);
  });

  test('catalog has unique IDs and valid exercise choices', () {
    expect(lessons.map((lesson) => lesson.id).toSet().length, lessons.length);
    for (final lesson in lessons) {
      expect(lesson.exercises, isNotEmpty);
      for (final exercise in lesson.exercises) {
        expect(exercise.answer, inInclusiveRange(0, exercise.choices.length - 1));
        expect(exercise.choices.toSet().length, exercise.choices.length);
      }
    }
  });

  test('complete modern kana coverage has no missing teaching prompts', () {
    final expected = {
      'Basic hiragana': 'あ い う え お か き く け こ さ し す せ そ た ち つ て と な に ぬ ね の は ひ ふ へ ほ ま み む め も や ゆ よ ら り る れ ろ わ を ん',
      'Voiced sounds': 'が ぎ ぐ げ ご ざ じ ず ぜ ぞ だ ぢ づ で ど ば び ぶ べ ぼ ぱ ぴ ぷ ぺ ぽ',
      'Combined sounds': 'きゃ きゅ きょ ぎゃ ぎゅ ぎょ しゃ しゅ しょ じゃ じゅ じょ ちゃ ちゅ ちょ ぢゃ ぢゅ ぢょ にゃ にゅ にょ ひゃ ひゅ ひょ みゃ みゅ みょ りゃ りゅ りょ びゃ びゅ びょ ぴゃ ぴゅ ぴょ',
    };
    const prefix = 'Which romaji matches ';
    for (final entry in expected.entries) {
      final taught = [
        for (final lesson in lessons.where((lesson) => lesson.section == entry.key))
          for (final exercise in lesson.exercises)
            if (exercise.prompt.startsWith(prefix))
              exercise.prompt.substring(prefix.length, exercise.prompt.length - 1),
      ];
      expect(taught, unorderedEquals(entry.value.split(' ')), reason: entry.key);
    }
    expect(lessons.where((lesson) => lesson.section == 'Reading rules').length, 4);
  });

  test('mistakes contain only missed questions once and in lesson order', () {
    final session = LessonSession(greetings);
    session.submit(1);
    session.submit(2);
    session.next();
    session.submit(1);
    session.next();
    session.submit(0);
    session.next();
    session.submit(0);
    session.next();
    expect(session.correct, 2);
    expect(session.mistakes, [greetings.exercises[0], greetings.exercises[2]]);
    expect(() => session.mistakes.clear(), throwsUnsupportedError);
    final review = LessonSession(Lesson('review', 'Review', '', session.mistakes));
    review.submit(0);
    review.next();
    review.submit(2);
    review.next();
    expect(review.correct, 2);
    expect(review.mistakes, isEmpty);
    expect(session.correct, 2);
    expect(session.mistakes.length, 2);
  });
}
