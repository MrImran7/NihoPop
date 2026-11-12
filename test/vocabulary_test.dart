import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/lesson.dart';
import 'package:nihopop/progress.dart';
import 'support/lesson_actions.dart';

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(finder, 200, maxScrolls: 250);
  } else {
    await tester.ensureVisible(finder);
  }
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}


void main() {
  final expected = <Lesson, List<String>>{
    vocabularyPeople: ['Person', 'Friend', 'Teacher', 'Student', 'Child', 'Family', '人（ひと）', '友達（ともだち）', '先生（せんせい）', '学生（がくせい）', '子供（こども）', '家族（かぞく）'],
    vocabularyFood: ['Water', 'Tea', 'Cooked rice / meal', 'Bread', 'Fish', 'Egg', '水（みず）', 'お茶（おちゃ）', 'ご飯（ごはん）', 'パン', '魚（さかな）', '卵（たまご）'],
    vocabularyPlaces: ['School', 'Station', 'Shop', 'Hospital', 'Library', 'Park', '学校（がっこう）', '駅（えき）', '店（みせ）', '病院（びょういん）', '図書館（としょかん）', '公園（こうえん）'],
    vocabularyObjects: ['Book', 'Bag', 'Telephone', 'Key', 'Clock / watch', 'Umbrella', '本（ほん）', 'かばん', '電話（でんわ）', '鍵（かぎ）', '時計（とけい）', '傘（かさ）'],
  };

  for (final entry in expected.entries) {
    testWidgets('${entry.key.id}: both directions save independently', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({
        for (final lesson in lessons.where((lesson) => lesson != entry.key)) ...{
          'best.${lesson.id}': 2, 'completed.${lesson.id}': true,
        },
      });
      final store = ProgressStore(await SharedPreferences.getInstance());
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(entry.key == vocabularyObjects ? 1.6 : 1)),
          child: child!,
        ),
        home: LessonPage(store: store, lesson: entry.key),
      ));
      expect(find.text(entry.key.introduction), findsOneWidget);
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Let’s practice'));
      expect(tester.widget<FilledButton>(find.widgetWithText(FilledButton, 'Check answer')).onPressed, isNull);
      for (final answer in entry.value) {
        await tapVisible(tester, find.widgetWithText(OutlinedButton, answer));
        await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
        expect(find.text('Correct!'), findsOneWidget);
        await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
      }
      expect(find.text('12 of 12 correct'), findsOneWidget);
      expect(find.text('Review mistakes'), findsNothing);
      final reopened = ProgressStore(await SharedPreferences.getInstance());
      expect(reopened.best(entry.key.id), 12);
      expect(reopened.completed(entry.key.id), true);
      for (final lesson in lessons.where((lesson) => lesson != entry.key)) {
        expect(reopened.best(lesson.id), 2, reason: lesson.id);
        expect(reopened.completed(lesson.id), true);
      }
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('vocabulary picker uses meaning labels and keeps its group', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(NihoPopApp(store: store));
    await selectLessonGroup(tester, 'Vocabulary basics');
    final card = find.byKey(ValueKey('lesson-${vocabularyPeople.id}'));
    expect(find.descendant(of: card, matching: find.text('12 questions • Japanese ↔ English')), findsOneWidget);
    expect(find.text(greetings.title), findsNothing);
    await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
    expect(find.text(vocabularyPeople.introduction), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Vocabulary basics'), findsOneWidget);
    expect(store.completed(vocabularyPeople.id), false);
  });

  testWidgets('vocabulary mistake review retains reading and original score', (tester) async {
    SharedPreferences.setMockInitialValues({
      'best.hiragana-vowels-v1': 8, 'completed.hiragana-vowels-v1': true,
      'best.katakana-vowels-v1': 9, 'completed.katakana-vowels-v1': true,
    });
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(NihoPopApp(store: store));
    await selectLessonGroup(tester, 'Vocabulary basics');
    final card = find.byKey(ValueKey('lesson-${vocabularyPeople.id}'));
    await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Let’s practice'));
    expect(find.text('What does 人（ひと） mean?'), findsOneWidget);
    final attempt = ['Friend', ...expected[vocabularyPeople]!.skip(1)];
    for (final answer in attempt) {
      await tapVisible(tester, find.widgetWithText(OutlinedButton, answer));
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
    }
    expect(find.text('11 of 12 correct'), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Review mistakes'));
    expect(find.text('Question 1 of 1'), findsOneWidget);
    expect(find.text('What does 人（ひと） mean?'), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(OutlinedButton, 'Person'));
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
    expect(find.text('Review complete!'), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(OutlinedButton, 'Back to lessons'));
    expect(find.text('Completed • Best: 11/12'), findsOneWidget);
    final reopened = ProgressStore(await SharedPreferences.getInstance());
    expect(reopened.best(vocabularyPeople.id), 11);
    expect(reopened.best(hiraganaVowels.id), 8);
    expect(reopened.best(katakanaVowels.id), 9);
  });

  test('each topic teaches six words with readings in both directions', () {
    expect(vocabularyLessons.length, 4);
    for (final entry in expected.entries) {
      expect(entry.key.exercises.length, 12);
      expect(entry.key.id.startsWith('vocabulary-'), true);
      for (var i = 0; i < 6; i++) {
        final meaning = entry.value[i];
        final japanese = entry.value[i + 6];
        final forward = entry.key.exercises[i];
        final reverse = entry.key.exercises[i + 6];
        expect(entry.key.introduction, contains(japanese));
        expect(forward.prompt, contains(japanese));
        expect(forward.choices[forward.answer], meaning);
        expect(reverse.prompt, contains(meaning));
        expect(reverse.choices[reverse.answer], japanese);
        expect(forward.explanation, contains(japanese));
      }
    }
  });
}
