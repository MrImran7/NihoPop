import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/lesson.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/progress.dart';
import 'package:nihopop/vocabulary_words.dart';
import 'package:nihopop/word_bank.dart';
import 'support/lesson_actions.dart';

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(finder, 120,
      scrollable: find.descendant(
        of: find.byType(ListView), matching: find.byType(Scrollable),
      ).first,
      maxScrolls: 50,
    );
  } else {
    await tester.ensureVisible(finder);
  }
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

void main() {
  test('word bank covers exactly the taught vocabulary and links both directions', () {
    expect(vocabularyWords.length, 48);
    expect(vocabularyWords.map((w) => w.japanese).toSet().length, 48);
    for (final lesson in vocabularyLessons) {
      final words = vocabularyWords.where((w) => w.lesson == lesson).toList();
      expect(words.length, 6);
      for (var i = 0; i < words.length; i++) {
        final word = words[i];
        expect(lesson.introduction, contains('${word.label} — ${word.meaning}'));
        final forward = lesson.exercises[i];
        final reverse = lesson.exercises[i + 6];
        expect(forward.prompt, contains(word.label));
        expect(forward.choices[forward.answer], word.meaning);
        expect(reverse.prompt, contains(word.meaning));
        expect(reverse.choices[reverse.answer], word.label);
      }
    }
  });

  test('search accepts English, whitespace, kanji and either kana script', () {
    final cases = {
      '  LIBRARY  ': '図書館',
      'としょかん': '図書館',
      'トショカン': '図書館',
      '図書': '図書館',
      'ぱん': 'パン',
      'タクシー': 'タクシー',
      'to   read': '読む',
      'watch': '時計',
    };
    for (final entry in cases.entries) {
      expect(searchVocabulary(entry.key).map((w) => w.japanese),
          contains(entry.value), reason: entry.key);
    }
    expect(searchVocabulary('   ').length, 48);
    expect(searchVocabulary('not-a-taught-word'), isEmpty);
    expect(searchVocabulary('tea', lessonId: vocabularyTransport.id), isEmpty);
    expect(searchVocabulary('', lessonId: vocabularyTransport.id).length, 6);
  });

  testWidgets('search and topic filter combine, clear and reset', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WordBankPage(onOpenLesson: (_) {}),
    ));
    expect(find.text('48 words'), findsOneWidget);
    await tester.enterText(find.byKey(const ValueKey('word-search')), '  TEA ');
    await tester.pumpAndSettle();
    expect(find.text('お茶（おちゃ）'), findsOneWidget);
    // "tea" also matches "Teacher".
    expect(find.text('2 words'), findsOneWidget);
    await tapVisible(tester, find.byKey(const ValueKey('word-topic')));
    final menu = find.byType(Scrollable).last;
    final food = find.descendant(of: menu, matching: find.text('food and drink'));
    await tester.scrollUntilVisible(food, 120, scrollable: menu);
    await tester.tap(food);
    await tester.pumpAndSettle();
    expect(find.text('1 word'), findsOneWidget);
    await tapVisible(tester, find.byTooltip('Clear search'));
    expect(find.text('6 words'), findsOneWidget);
    await tester.enterText(find.byKey(const ValueKey('word-search')), 'train');
    await tester.pumpAndSettle();
    expect(find.text('0 words'), findsOneWidget);
    expect(find.text('No matching words. Try another spelling or reset the filters.'),
        findsOneWidget);
    await tapVisible(tester, find.text('Reset filters'));
    expect(find.text('48 words'), findsOneWidget);
    expect(tester.widget<TextField>(
        find.byKey(const ValueKey('word-search'))).controller!.text, isEmpty);
    expect(find.text('All topics'), findsOneWidget);
  });

  testWidgets('word bank opens correct lesson and preserves search, group and scores',
      (tester) async {
    SharedPreferences.setMockInitialValues({
      'best.hiragana-vowels-v1': 8, 'completed.hiragana-vowels-v1': true,
      'best.vocabulary-food-v1': 9, 'completed.vocabulary-food-v1': true,
    });
    final preferences = await SharedPreferences.getInstance();
    final store = ProgressStore(preferences);
    await tester.pumpWidget(NihoPopApp(store: store));
    await selectLessonGroup(tester, 'Vocabulary basics');
    await tester.tap(find.byTooltip('Word bank'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const ValueKey('word-search')), 'train');
    await tester.pumpAndSettle();
    expect(find.text('電車（でんしゃ）'), findsOneWidget);
    expect(store.completed(vocabularyTransport.id), false);
    await tapVisible(tester, find.text('Open lesson'));
    expect(find.text(vocabularyTransport.introduction), findsOneWidget);
    await tapVisible(tester, find.text('Let’s practice'));
    for (final exercise in vocabularyTransport.exercises) {
      await tapVisible(tester, find.widgetWithText(
          OutlinedButton, exercise.choices[exercise.answer]));
      await tapVisible(tester, find.text('Check answer'));
      await tapVisible(tester, find.text('Continue'));
    }
    expect(find.text('12 of 12 correct'), findsOneWidget);
    await tapVisible(tester, find.text('Back to word bank'));
    expect(find.text('Word bank'), findsOneWidget);
    expect(tester.widget<TextField>(
        find.byKey(const ValueKey('word-search'))).controller!.text, 'train');
    expect(find.text('1 word'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Vocabulary basics'), findsOneWidget);
    final reopened = ProgressStore(preferences);
    expect(reopened.best(vocabularyTransport.id), 12);
    expect(reopened.best(hiraganaVowels.id), 8);
    expect(reopened.best(vocabularyFood.id), 9);
    expect(reopened.completed(vocabularyPeople.id), false);
    expect(tester.takeException(), isNull);
  });

  testWidgets('browsing and abandoning a linked lesson never marks completion',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    await tester.pumpWidget(NihoPopApp(store: ProgressStore(preferences)));
    await tester.tap(find.byTooltip('Word bank'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const ValueKey('word-search')), 'library');
    await tester.pumpAndSettle();
    await tapVisible(tester, find.text('Open lesson'));
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(preferences.getKeys(), isEmpty);
  });

  testWidgets('large text and landscape keyboard leave controls reachable',
      (tester) async {
    tester.view.physicalSize = const Size(844, 390);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    Lesson? opened;
    await tester.pumpWidget(MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1.6),
          viewInsets: const EdgeInsets.only(bottom: 180),
        ),
        child: child!,
      ),
      home: WordBankPage(onOpenLesson: (lesson) => opened = lesson),
    ));
    await tester.enterText(find.byKey(const ValueKey('word-search')), 'rice');
    await tester.pumpAndSettle();
    await tapVisible(tester, find.text('Open lesson'));
    expect(opened, vocabularyFood);
    expect(tester.takeException(), isNull);
  });
}
