import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/progress.dart';
import 'package:nihopop/saved_words.dart';
import 'package:nihopop/vocabulary_words.dart';
import 'package:nihopop/word_bank.dart';

class ControlledSavedWords extends SavedWordsStore {
  Completer<void>? pending;
  bool fail = false;
  int calls = 0;
  ControlledSavedWords(super.preferences);

  @override
  Future<void> setSaved(VocabularyWord word, bool saved) async {
    calls++;
    if (pending != null) await pending!.future;
    if (fail) throw StateError('Test write failure');
    await super.setSaved(word, saved);
  }
}

Future<void> show(WidgetTester tester, Finder finder, {double delta = 120}) async {
  await tester.scrollUntilVisible(finder, delta,
    scrollable: find.descendant(
      of: find.byType(ListView), matching: find.byType(Scrollable),
    ).first,
    maxScrolls: 80,
  );
  await tester.pumpAndSettle();
}

Future<void> tap(WidgetTester tester, Finder finder, {double delta = 120}) async {
  await show(tester, finder, delta: delta);
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

Future<void> search(WidgetTester tester, String query) async {
  final field = find.byKey(const ValueKey('word-search'));
  await show(tester, field, delta: -120);
  await tester.enterText(field, query);
  await tester.pumpAndSettle();
}

void main() {
  late SharedPreferences preferences;
  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'best.hiragana-vowels-v1': 8,
      'completed.hiragana-vowels-v1': true,
      'best.vocabulary-food-v1': 9,
    });
    preferences = await SharedPreferences.getInstance();
  });

  test('bookmark IDs are unique and saves/removals survive reloading independently', () async {
    expect(vocabularyWords.map((w) => w.id).toSet().length, vocabularyWords.length);
    final store = SavedWordsStore(preferences);
    final first = vocabularyWords.first;
    final last = vocabularyWords.last;
    await store.setSaved(first, true);
    await store.setSaved(last, true);
    await store.setSaved(first, true);
    await preferences.reload();
    var reopened = SavedWordsStore(preferences);
    expect(reopened.contains(first), true);
    expect(reopened.contains(last), true);
    await reopened.setSaved(first, false);
    await preferences.reload();
    reopened = SavedWordsStore(preferences);
    expect(reopened.contains(first), false);
    expect(reopened.contains(last), true);
    expect(preferences.getInt('best.hiragana-vowels-v1'), 8);
    expect(preferences.getBool('completed.hiragana-vowels-v1'), true);
    expect(preferences.getInt('best.vocabulary-food-v1'), 9);
  });

  testWidgets('save a word, practise only saved results, reopen and remove it',
      (tester) async {
    final rice = searchVocabulary('rice').single;
    await tester.pumpWidget(NihoPopApp(store: ProgressStore(preferences)));
    await tester.tap(find.byTooltip('Word bank'));
    await tester.pumpAndSettle();
    await tap(tester, find.byKey(const ValueKey('saved-only')));
    expect(find.text('0 words'), findsOneWidget);
    final start = find.byKey(const ValueKey('start-flashcards'));
    await show(tester, start);
    expect(tester.widget<FilledButton>(start).onPressed, isNull);
    await tap(tester, find.text('Reset filters'));
    await search(tester, 'rice');
    await tap(tester, find.byKey(ValueKey('save-${rice.id}')));
    expect(find.text('Remove saved word'), findsOneWidget);
    await tap(tester, find.byKey(const ValueKey('saved-only')), delta: -120);
    await tap(tester, start);
    expect(find.text('Card 1 of 1'), findsOneWidget);
    expect(find.text('ご飯（ごはん）'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await show(tester, find.byKey(const ValueKey('saved-only')), delta: -120);
    expect(tester.widget<FilterChip>(find.byKey(
        const ValueKey('saved-only'))).selected, true);
    // Rebuild the app/store to exercise persisted data, not only screen state.
    await tester.pumpWidget(const SizedBox.shrink());
    await preferences.reload();
    await tester.pumpWidget(NihoPopApp(store: ProgressStore(preferences)));
    await tester.tap(find.byTooltip('Word bank'));
    await tester.pumpAndSettle();
    await tap(tester, find.byKey(const ValueKey('saved-only')));
    expect(find.text('1 word'), findsOneWidget);
    await tap(tester, find.byKey(ValueKey('save-${rice.id}')));
    await show(tester, find.byKey(const ValueKey('word-count')), delta: -120);
    expect(find.text('0 words'), findsOneWidget);
    expect(SavedWordsStore(preferences).contains(rice), false);
    expect(preferences.getInt('best.vocabulary-food-v1'), 9);
    expect(preferences.getBool('completed.vocabulary-food-v1'), isNull);
    expect(preferences.getInt('best.hiragana-vowels-v1'), 8);
  });

  testWidgets('saved filter combines with topic/search and reset keeps bookmarks',
      (tester) async {
    final saved = SavedWordsStore(preferences);
    await saved.setSaved(searchVocabulary('rice').single, true);
    await saved.setSaved(searchVocabulary('train').single, true);
    await tester.pumpWidget(MaterialApp(
      home: WordBankPage(savedWords: saved, onOpenLesson: (_) {}),
    ));
    await tap(tester, find.byKey(const ValueKey('saved-only')));
    expect(find.text('2 words'), findsOneWidget);
    await tap(tester, find.byKey(const ValueKey('word-topic')), delta: -120);
    final menu = find.byType(Scrollable).last;
    final food = find.descendant(of: menu, matching: find.text('food and drink'));
    await tester.scrollUntilVisible(food, 120, scrollable: menu);
    await tester.tap(food);
    await tester.pumpAndSettle();
    await show(tester, find.byKey(const ValueKey('word-count')));
    expect(find.text('1 word'), findsOneWidget);
    await search(tester, 'train');
    await show(tester, find.byKey(const ValueKey('word-count')));
    expect(find.text('0 words'), findsOneWidget);
    await tap(tester, find.text('Reset filters'));
    await show(tester, find.byKey(const ValueKey('word-count')), delta: -120);
    expect(find.text('48 words'), findsOneWidget);
    expect(saved.contains(searchVocabulary('rice').single), true);
    expect(saved.contains(searchVocabulary('train').single), true);
  });

  testWidgets('pending writes cannot repeat; failed writes stay unsaved and can retry',
      (tester) async {
    final saved = ControlledSavedWords(preferences)
      ..pending = Completer<void>() ..fail = true;
    final rice = searchVocabulary('rice').single;
    await tester.pumpWidget(MaterialApp(
      home: WordBankPage(savedWords: saved, onOpenLesson: (_) {}),
    ));
    await search(tester, 'rice');
    final button = find.byKey(ValueKey('save-${rice.id}'));
    await tap(tester, button);
    expect(tester.widget<TextButton>(button).onPressed, isNull);
    await tester.tap(button);
    await tester.pump();
    expect(saved.calls, 1);
    saved.pending!.complete();
    await tester.pumpAndSettle();
    expect(saved.contains(rice), false);
    expect(find.text('Could not update saved words. Please try again.'), findsOneWidget);
    expect(tester.widget<TextButton>(button).onPressed, isNotNull);
    saved.fail = false;
    await tap(tester, button);
    expect(saved.contains(rice), true);
    expect(SavedWordsStore(preferences).contains(rice), true);
    expect(saved.calls, 2);
  });

  testWidgets('leaving during a save completes without setState after dispose',
      (tester) async {
    final saved = ControlledSavedWords(preferences)..pending = Completer<void>();
    final rice = searchVocabulary('rice').single;
    await tester.pumpWidget(MaterialApp(
      home: WordBankPage(savedWords: saved, onOpenLesson: (_) {}),
    ));
    await search(tester, 'rice');
    await tap(tester, find.byKey(ValueKey('save-${rice.id}')));
    await tester.pumpWidget(const SizedBox.shrink());
    saved.pending!.complete();
    await tester.pumpAndSettle();
    expect(saved.contains(rice), true);
    expect(tester.takeException(), isNull);
  });

  testWidgets('saved controls work with enlarged text in landscape', (tester) async {
    tester.view.physicalSize = const Size(844, 390);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final saved = SavedWordsStore(preferences);
    final rice = searchVocabulary('rice').single;
    await tester.pumpWidget(MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.6)),
        child: child!,
      ),
      home: WordBankPage(savedWords: saved, onOpenLesson: (_) {}),
    ));
    await search(tester, 'rice');
    await tap(tester, find.byKey(ValueKey('save-${rice.id}')));
    expect(saved.contains(rice), true);
    await tap(tester, find.byKey(const ValueKey('saved-only')), delta: -120);
    await show(tester, find.byKey(const ValueKey('word-count')));
    expect(find.text('1 word'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
