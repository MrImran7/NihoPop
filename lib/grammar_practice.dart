import 'dart:math';
import 'lesson.dart';
import 'progress.dart';

class GrammarQuestion {
  final Lesson lesson;
  final int index;
  const GrammarQuestion(this.lesson, this.index);
  String get id => '${lesson.id}:$index';
  Exercise get exercise => lesson.exercises[index];
}

class GrammarPracticeStore {
  static const storageKey = 'grammar-practice.mistakes.v1';
  final ProgressStore progress;
  GrammarPracticeStore(this.progress);

  List<GrammarQuestion> get available => [
    for (final lesson in grammarLessons)
      if (progress.completed(lesson.id))
        for (var i = 0; i < lesson.exercises.length; i++)
          GrammarQuestion(lesson, i),
  ];

  List<GrammarQuestion> get mistakes {
    final ids = (progress.preferences.getStringList(storageKey) ?? []).toSet();
    return available.where((q) => ids.contains(q.id)).toList();
  }

  List<GrammarQuestion> questionsFor(Set<String>? lessonIds) =>
      available.where((q) => lessonIds == null || lessonIds.contains(q.lesson.id)).toList();

  List<GrammarQuestion> mistakesFor(Set<String>? lessonIds) =>
      mistakes.where((q) => lessonIds == null || lessonIds.contains(q.lesson.id)).toList();

  // Round-robin across shuffled topics, then shuffle the session order.
  List<GrammarQuestion> mixed({Random? random, int limit = 10, Set<String>? lessonIds}) {
    if (limit <= 0) return [];
    final rng = random ?? Random();
    final groups = <String, List<GrammarQuestion>>{};
    for (final q in questionsFor(lessonIds)) {
      groups.putIfAbsent(q.lesson.id, () => []).add(q);
    }
    final rows = groups.values.toList()..shuffle(rng);
    for (final row in rows) { row.shuffle(rng); }
    final result = <GrammarQuestion>[];
    var index = 0;
    while (result.length < limit) {
      var added = false;
      for (final row in rows) {
        if (index < row.length && result.length < limit) {
          result.add(row[index]);
          added = true;
        }
      }
      if (!added) break;
      index++;
    }
    return result..shuffle(rng);
  }

  List<GrammarQuestion> review({Random? random, int limit = 10, Set<String>? lessonIds}) {
    if (limit <= 0) return [];
    return (mistakesFor(lessonIds)..shuffle(random ?? Random())).take(limit).toList();
  }

  Future<void> record(List<Exercise> attempted, List<Exercise> missed) async {
    final valid = available;
    final ids = (progress.preferences.getStringList(storageKey) ?? [])
        .where((id) => valid.any((q) => q.id == id)).toSet();
    for (final q in valid) {
      if (attempted.contains(q.exercise)) {
        if (missed.contains(q.exercise)) {
          ids.add(q.id);
        } else {
          ids.remove(q.id);
        }
      }
    }
    final sorted = ids.toList()..sort();
    if (!await progress.preferences.setStringList(storageKey, sorted)) {
      throw StateError('Could not save grammar practice');
    }
  }
}
