import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/lesson.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/progress.dart';
import 'package:nihopop/grammar_practice.dart';

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(finder, 180,
        scrollable: find.byType(Scrollable).first, maxScrolls: 80);
  } else {
    await tester.ensureVisible(finder);
  }
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

Future<ProgressStore> seeded({bool completed = true}) async {
  SharedPreferences.setMockInitialValues({
    if (completed)
      for (final lesson in grammarLessons) ...{
        'completed.${lesson.id}': true,
        'best.${lesson.id}': 3,
      },
    'best.greetings-v1': 4,
    'saved-word.v1.vocabulary-people-v1:人': true,
  });
  return ProgressStore(await SharedPreferences.getInstance());
}

void main() {
  test('mix includes only completed grammar and never duplicates questions', () async {
    final progress = await seeded(completed: false);
    final store = GrammarPracticeStore(progress);
    expect(store.mixed(), isEmpty);
    await progress.record(greetings.id, 4);
    expect(store.mixed(), isEmpty);
    await progress.record(grammarStatements.id, 4);
    final mix = store.mixed(random: Random(1));
    expect(mix.length, 8);
    expect(mix.map((q) => q.id).toSet().length, 8);
    expect(mix.every((q) => q.lesson == grammarStatements), true);
    expect(store.mixed(limit: 0), isEmpty);
  });

  test('mixed practice spreads across topics and randomizes between seeds', () async {
    final store = GrammarPracticeStore(await seeded());
    final a = store.mixed(random: Random(1));
    final b = store.mixed(random: Random(2));
    expect(a.length, 10);
    expect(a.map((q) => q.lesson.id).toSet().length, 10);
    expect(a.map((q) => q.id).toList(), isNot(b.map((q) => q.id).toList()));
    expect(store.mixed(limit: 1000).length, 176);
  });

  test('mistakes persist, deduplicate and clear only when attempted correctly', () async {
    final progress = await seeded();
    final store = GrammarPracticeStore(progress);
    final a = grammarStatements.exercises[0];
    final b = grammarLikes.exercises[0];
    await store.record([a, b], [a, b]);
    await store.record([a], [a]);
    expect(GrammarPracticeStore(progress).mistakes.length, 2);
    await store.record([a], []);
    expect(store.mistakes.map((q) => q.exercise), [b]);
    expect(progress.best(grammarStatements.id), 3);
    expect(progress.best(greetings.id), 4);
    expect(progress.preferences.getBool('saved-word.v1.vocabulary-people-v1:人'), true);
    await store.record([b], []);
    expect(store.review(), isEmpty);
  });

  test('review caps at ten, ignores stale IDs and keeps untouched mistakes', () async {
    final progress = await seeded();
    final store = GrammarPracticeStore(progress);
    final qs = store.available.take(13).toList();
    await progress.preferences.setStringList(GrammarPracticeStore.storageKey,
        [...qs.map((q) => q.id), 'deleted-lesson:0', 'grammar-statements-v1:999']);
    final review = store.review(random: Random(3));
    expect(review.length, 10);
    expect(review.map((q) => q.id).toSet().length, 10);
    await store.record(review.map((q) => q.exercise).toList(), []);
    expect(store.mistakes.length, 3);
    expect(progress.preferences.getStringList(GrammarPracticeStore.storageKey)!.length, 3);
  });

  testWidgets('empty practice guides learner and disables both starts', (tester) async {
    final progress = await seeded(completed: false);
    await tester.pumpWidget(NihoPopApp(store: progress));
    await tester.tap(find.byTooltip('Grammar practice'));
    await tester.pumpAndSettle();
    expect(find.text('Complete a grammar lesson first, then return here to practise.'), findsOneWidget);
    expect(tester.widget<FilledButton>(find.byKey(const ValueKey('start-grammar-mix'))).onPressed, isNull);
    expect(tester.widget<OutlinedButton>(find.byKey(const ValueKey('review-grammar-mistakes'))).onPressed, isNull);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('NihoPop'), findsOneWidget);
  });

  testWidgets('mixed practice saves mistakes across reopening and targeted review clears them', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final progress = await seeded();
    final practice = GrammarPracticeStore(progress);
    Widget app() => MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.6)),
        child: child!,
      ),
      home: HomePage(store: progress),
    );
    await tester.pumpWidget(app());
    await tester.tap(find.byTooltip('Grammar practice'));
    await tester.pumpAndSettle();
    await tapVisible(tester, find.byKey(const ValueKey('start-grammar-mix')));
    await tapVisible(tester, find.text('Let’s practice'));
    Exercise? missed;
    for (var i = 0; i < 10; i++) {
      final exercise = practice.available.map((q) => q.exercise).firstWhere(
          (e) => find.text(e.prompt).evaluate().isNotEmpty);
      if (i == 0) missed = exercise;
      final answer = i == 0 ? (exercise.answer + 1) % exercise.choices.length : exercise.answer;
      await tapVisible(tester, find.widgetWithText(OutlinedButton, exercise.choices[answer]));
      await tapVisible(tester, find.text('Check answer'));
      await tapVisible(tester, find.text('Continue'));
    }
    expect(find.text('Practice complete!'), findsOneWidget);
    expect(find.text('9 of 10 correct'), findsOneWidget);
    expect(practice.mistakes.single.exercise, missed);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(app());
    await tester.tap(find.byTooltip('Grammar practice'));
    await tester.pumpAndSettle();
    await tapVisible(tester, find.byKey(const ValueKey('review-grammar-mistakes')));
    await tapVisible(tester, find.text('Let’s practice'));
    expect(find.text('Question 1 of 1'), findsOneWidget);
    expect(find.text(missed!.prompt), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(OutlinedButton, missed.choices[missed.answer]));
    await tapVisible(tester, find.text('Check answer'));
    await tapVisible(tester, find.text('Continue'));
    expect(GrammarPracticeStore(progress).mistakes, isEmpty);
    await tapVisible(tester, find.text('Back to grammar practice'));
    await tapVisible(tester, find.text('Saved mistakes: 0'));
    for (final lesson in grammarLessons) {
      expect(progress.best(lesson.id), 3);
      expect(progress.completed(lesson.id), true);
    }
    expect(progress.preferences.containsKey('best.grammar-practice-session'), false);
    expect(progress.best(greetings.id), 4);
    expect(progress.preferences.getBool('saved-word.v1.vocabulary-people-v1:人'), true);
    expect(tester.takeException(), isNull);
  });

  testWidgets('unfinished practice leaves saved mistakes unchanged', (tester) async {
    final progress = await seeded();
    final practice = GrammarPracticeStore(progress);
    final exercise = grammarStatements.exercises[0];
    await practice.record([exercise], [exercise]);
    await tester.pumpWidget(MaterialApp(home: LessonPage(
      store: progress,
      lesson: Lesson('practice', 'Practice', 'Notes', [exercise]),
      onPracticeCompleted: practice.record,
    )));
    await tapVisible(tester, find.text('Let’s practice'));
    await tapVisible(tester, find.widgetWithText(OutlinedButton, exercise.choices[exercise.answer]));
    await tapVisible(tester, find.text('Check answer'));
    // Closing before Continue/finish must not clear the saved mistake.
    await tester.pumpWidget(const SizedBox.shrink());
    expect(GrammarPracticeStore(progress).mistakes.single.exercise, exercise);
  });

  testWidgets('failed practice save can retry and immediate review saves corrections', (tester) async {
    final progress = await seeded();
    final practice = GrammarPracticeStore(progress);
    final exercise = grammarStatements.exercises[0];
    var fail = true;
    await tester.pumpWidget(MaterialApp(home: LessonPage(
      store: progress,
      lesson: Lesson('practice', 'Practice', 'Notes', [exercise]),
      onPracticeCompleted: (attempted, missed) async {
        if (fail) throw StateError('Simulated write failure');
        await practice.record(attempted, missed);
      },
    )));
    await tapVisible(tester, find.text('Let’s practice'));
    await tapVisible(tester, find.widgetWithText(OutlinedButton,
        exercise.choices[(exercise.answer + 1) % exercise.choices.length]));
    await tapVisible(tester, find.text('Check answer'));
    await tapVisible(tester, find.text('Continue'));
    expect(find.text('Practice could not be saved. Please try again.'), findsOneWidget);
    expect(find.text('Review mistakes'), findsNothing);
    fail = false;
    await tapVisible(tester, find.text('Retry saving'));
    expect(practice.mistakes.length, 1);
    await tapVisible(tester, find.text('Review mistakes'));
    await tapVisible(tester, find.widgetWithText(OutlinedButton, exercise.choices[exercise.answer]));
    await tapVisible(tester, find.text('Check answer'));
    await tapVisible(tester, find.text('Continue'));
    expect(find.text('Review complete!'), findsOneWidget);
    expect(practice.mistakes, isEmpty);
    expect(progress.best(grammarStatements.id), 3);
    expect(tester.takeException(), isNull);
  });
}
