import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/flashcards.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/progress.dart';
import 'package:nihopop/vocabulary_words.dart';

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(finder, 120,
      scrollable: find.descendant(
        of: find.byType(ListView), matching: find.byType(Scrollable),
      ).first,
      maxScrolls: 80,
    );
  } else {
    await tester.ensureVisible(finder);
  }
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('all 48 cards reveal, advance and finish without leaking the next answer',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FlashcardsPage(words: vocabularyWords),
    ));
    for (var i = 0; i < vocabularyWords.length; i++) {
      expect(find.text('Card ${i + 1} of 48'), findsOneWidget);
      expect(tester.widget<Text>(find.byKey(
          const ValueKey('flashcard-prompt'))).data, vocabularyWords[i].label);
      expect(find.byKey(const ValueKey('flashcard-answer')), findsNothing);
      final next = find.widgetWithText(OutlinedButton,
          i == 47 ? 'Finish practice' : 'Next card');
      expect(tester.widget<OutlinedButton>(next).onPressed, isNull);
      await tapVisible(tester, find.text('Reveal answer'));
      expect(tester.widget<Text>(find.byKey(
          const ValueKey('flashcard-answer'))).data, vocabularyWords[i].meaning);
      expect(tester.widget<FilledButton>(find.widgetWithText(
          FilledButton, 'Reveal answer')).onPressed, isNull);
      await tapVisible(tester, next);
    }
    expect(find.text('Practice complete!'), findsOneWidget);
    expect(find.text('You reviewed 48 cards.'), findsOneWidget);
    await tapVisible(tester, find.text('Practise again'));
    expect(find.text('Card 1 of 48'), findsOneWidget);
    expect(find.byKey(const ValueKey('flashcard-answer')), findsNothing);
  });

  testWidgets('switching direction hides the answer and uses kana on the reverse',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FlashcardsPage(words: [vocabularyWords.first]),
    ));
    await tapVisible(tester, find.text('Reveal answer'));
    await tapVisible(tester, find.byKey(const ValueKey('flashcard-direction')));
    await tester.tap(find.text('English → Japanese').last);
    await tester.pumpAndSettle();
    expect(tester.widget<Text>(find.byKey(
        const ValueKey('flashcard-prompt'))).data, 'Person');
    expect(find.byKey(const ValueKey('flashcard-answer')), findsNothing);
    expect(find.text('人（ひと）'), findsNothing);
    await tapVisible(tester, find.text('Reveal answer'));
    expect(find.text('人（ひと）'), findsOneWidget);
    await tapVisible(tester, find.text('Finish practice'));
    expect(find.text('You reviewed 1 card.'), findsOneWidget);
    await tapVisible(tester, find.text('Practise again'));
    expect(tester.widget<Text>(find.byKey(
        const ValueKey('flashcard-prompt'))).data, 'Person');
    expect(find.byKey(const ValueKey('flashcard-answer')), findsNothing);
  });

  testWidgets('filtered practice returns to filters and never writes progress',
      (tester) async {
    SharedPreferences.setMockInitialValues({
      'best.vocabulary-food-v1': 9, 'completed.vocabulary-food-v1': true,
      'best.hiragana-vowels-v1': 8,
    });
    final preferences = await SharedPreferences.getInstance();
    final before = {for (final key in preferences.getKeys()) key: preferences.get(key)};
    await tester.pumpWidget(NihoPopApp(store: ProgressStore(preferences)));
    await tester.tap(find.byTooltip('Word bank'));
    await tester.pumpAndSettle();
    await tapVisible(tester, find.byKey(const ValueKey('word-topic')));
    final menu = find.byType(Scrollable).last;
    final food = find.descendant(of: menu, matching: find.text('food and drink'));
    await tester.scrollUntilVisible(food, 120, scrollable: menu);
    await tester.tap(food);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const ValueKey('word-search')), 'rice');
    await tester.pumpAndSettle();
    await tapVisible(tester, find.text('Practise flashcards'));
    expect(find.text('Card 1 of 1'), findsOneWidget);
    expect(find.text('ご飯（ごはん）'), findsOneWidget);
    await tapVisible(tester, find.text('Reveal answer'));
    expect(find.text('Cooked rice / meal'), findsOneWidget);
    await tapVisible(tester, find.text('Finish practice'));
    await tapVisible(tester, find.text('Back to word bank'));
    expect(tester.widget<TextField>(
        find.byKey(const ValueKey('word-search'))).controller!.text, 'rice');
    expect(tester.widget<DropdownButtonFormField<String>>(
        find.byKey(const ValueKey('word-topic'))).initialValue, 'vocabulary-food-v1');
    expect(find.text('1 word'), findsOneWidget);
    await tapVisible(tester, find.text('Practise flashcards'));
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect({for (final key in preferences.getKeys()) key: preferences.get(key)}, before);
    // Empty results cannot start a deck.
    await tester.enterText(find.byKey(const ValueKey('word-search')), 'xyz');
    await tester.pumpAndSettle();
    expect(tester.widget<FilledButton>(find.widgetWithText(
        FilledButton, 'Practise flashcards')).onPressed, isNull);
  });

  testWidgets('empty deck is safe and the deck snapshots its input', (tester) async {
    final input = [vocabularyWords.first];
    final page = FlashcardsPage(words: input);
    input.clear();
    await tester.pumpWidget(MaterialApp(home: page));
    expect(find.text('Card 1 of 1'), findsOneWidget);
    await tester.pumpWidget(MaterialApp(
      home: FlashcardsPage(key: const ValueKey('empty'), words: []),
    ));
    expect(find.text('No words to practise. Change your word-bank filters.'), findsOneWidget);
    expect(find.text('Reveal answer'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('large text landscape keeps reveal and finish reachable', (tester) async {
    tester.view.physicalSize = const Size(844, 390);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.6)),
        child: child!,
      ),
      home: FlashcardsPage(words: searchVocabulary('rice')),
    ));
    await tapVisible(tester, find.text('Reveal answer'));
    await tapVisible(tester, find.text('Finish practice'));
    expect(find.text('Practice complete!'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
