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
}
