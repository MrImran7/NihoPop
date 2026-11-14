import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/lesson.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/progress.dart';
import 'support/lesson_actions.dart';

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(finder, 160,
      scrollable: find.byType(Scrollable).first, maxScrolls: 80);
  } else {
    await tester.ensureVisible(finder);
  }
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

void main() {
  final answers = <Lesson, List<String>>{
    grammarNounPast: ['がくせいでした', 'そのときわたしはせんせいでした。', 'がくせいじゃなかったです', 'At that time, I was not a student.', 'そのときせんせいでしたか。', 'はい、がくせいでした。', 'いいえ、せんせいじゃなかったです。', 'がくせいではありませんでした'],
    grammarIAdjectives: ['かばんはおおきいです。', 'あたらしいほん', 'おおきくないです', 'The book is not old.', 'かばんはちいさいですか。', 'ほんはあたらしくないです。', 'ふるい', 'ちいさいかばん'],
    grammarNaAdjectives: ['こうえんはしずかです。', 'しずかなとしょかん', 'べんりじゃないです', 'The park is lively.', 'きれいながっこう', 'がっこうはきれいですか。', 'としょかんはしずかじゃないです。', 'あたらしいほん / しずかなこうえん'],
    grammarDestinations: ['えきにいきます。', 'に', 'e', 'I do not go to the park.', 'としょかんにいきますか。', 'へ', 'がっこうでほんをよみます。', 'こうえんにいきます。'],
    grammarTimes: ['に', 'はちじにがっこうにいきます。', 'The time', 'The destination', 'At three o’clock', 'くじ', 'Without に after あした', 'くじにえきにいきます。'],
    grammarPastActions: ['たべました', 'よみませんでした', 'きのうみずをのみました。', 'I did not eat bread yesterday.', 'きのうえきにいきましたか。', 'はい、いきました。', 'きました', 'いいえ、よみませんでした。'],
    grammarPoliteVerbs: ['たべます', 'のみます', 'よみます', 'みます', 'いきます', 'きます', 'よみません', 'I will go tomorrow.'],
    grammarObjects: ['パンをたべます。', 'を', 'o', 'みずをのみます。', 'パンをたべません。', 'ほんをよみますか。', 'Fish', 'I do not drink tea.'],
    grammarActionPlaces: ['で', 'こうえんでパンをたべます。', 'At the library', 'Water', 'としょかんでほんをよみません。', 'がっこうでみずをのみますか。', 'で, then を', 'がっこうでパンをたべます。'],
    grammarStatements: ['わたしはがくせいです。', 'I am a student.', 'は', 'です', 'wa', 'ともだちはせんせいです。', 'ともだち', 'Topic + は + noun + です'],
    grammarNegatives: ['わたしはがくせいじゃないです。', 'I am not a student.', 'じゃないです', 'ともだちはせんせいです。', 'わたしはがくせいじゃないです。', 'ともだちはがくせいじゃないです。', 'No; it only says they are not a student.', 'ではありません'],
    grammarPossession: ['わたしのほん', 'The teacher’s bag', 'の', 'ともだちのかさ', 'The teacher', 'わたしのかばん', 'My friend’s key', 'Owner + の + thing'],
    grammarDemonstratives: ['これはほんです。', 'それはかばんです。', 'あれはかさです。', 'This is my book.', 'これ', 'それ', 'あれ', 'これはわたしのかさです。'],
    grammarQuestions: ['これはほんですか。', 'Is this a book?', 'か', 'はい、ほんです。', 'いいえ、ほんじゃないです。', 'これはわたしのかぎですか。', 'これはかさですか。', 'これはわたしのほんですか。'],
  };
  for (final entry in answers.entries) {
    testWidgets('${entry.key.id}: complete and preserve other lesson scores', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({
        for (final lesson in lessons.where((l) => l != entry.key)) ...{
          'best.${lesson.id}': 2, 'completed.${lesson.id}': true,
        },
        'saved-word.v1.vocabulary-people-v1:人': true,
      });
      final preferences = await SharedPreferences.getInstance();
      final store = ProgressStore(preferences);
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler:
              TextScaler.linear((entry.key == grammarQuestions || entry.key == grammarActionPlaces || entry.key == grammarPastActions || entry.key == grammarNaAdjectives) ? 1.6 : 1)),
          child: child!,
        ),
        home: LessonPage(store: store, lesson: entry.key),
      ));
      expect(find.text(entry.key.introduction), findsOneWidget);
      await tapVisible(tester, find.text('Let’s practice'));
      for (final answer in entry.value) {
        await tapVisible(tester, find.widgetWithText(OutlinedButton, answer));
        await tapVisible(tester, find.text('Check answer'));
        expect(find.text('Correct!'), findsOneWidget);
        await tapVisible(tester, find.text('Continue'));
      }
      expect(find.text('8 of 8 correct'), findsOneWidget);
      expect(find.text('Review mistakes'), findsNothing);
      final reopened = ProgressStore(preferences);
      expect(reopened.best(entry.key.id), 8);
      expect(reopened.completed(entry.key.id), true);
      for (final lesson in lessons.where((l) => l != entry.key)) {
        expect(reopened.best(lesson.id), 2, reason: lesson.id);
        expect(reopened.completed(lesson.id), true);
      }
      expect(preferences.getBool('saved-word.v1.vocabulary-people-v1:人'), true);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('grammar navigation, abandoned attempt and review preserve progress',
      (tester) async {
    SharedPreferences.setMockInitialValues({
      'best.hiragana-vowels-v1': 8,
      'best.katakana-vowels-v1': 9,
      'best.vocabulary-people-v1': 10,
    });
    final preferences = await SharedPreferences.getInstance();
    final store = ProgressStore(preferences);
    await tester.pumpWidget(NihoPopApp(store: store));
    await selectLessonGroup(tester, 'Grammar basics');
    final card = find.byKey(ValueKey('lesson-${grammarStatements.id}'));
    expect(find.descendant(of: card,
        matching: find.text('8 questions • Sentence practice')), findsOneWidget);
    await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(store.completed(grammarStatements.id), false);
    expect(find.text('Grammar basics'), findsOneWidget);
    await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
    await tapVisible(tester, find.text('Let’s practice'));
    for (var i = 0; i < answers[grammarStatements]!.length; i++) {
      final answer = i == 0 ? 'わたしはともだちです。' : answers[grammarStatements]![i];
      await tapVisible(tester, find.widgetWithText(OutlinedButton, answer));
      await tapVisible(tester, find.text('Check answer'));
      await tapVisible(tester, find.text('Continue'));
    }
    expect(find.text('7 of 8 correct'), findsOneWidget);
    await tapVisible(tester, find.text('Review mistakes'));
    expect(find.text('Question 1 of 1'), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(OutlinedButton, 'わたしはがくせいです。'));
    await tapVisible(tester, find.text('Check answer'));
    await tapVisible(tester, find.text('Continue'));
    expect(find.text('Review complete!'), findsOneWidget);
    await tapVisible(tester, find.text('Back to lessons'));
    expect(find.text('Completed • Best: 7/8'), findsOneWidget);
    expect(store.best(grammarStatements.id), 7);
    expect(store.best(hiraganaVowels.id), 8);
    expect(store.best(katakanaVowels.id), 9);
    expect(store.best(vocabularyPeople.id), 10);
    await selectLessonGroup(tester, 'All lessons');
    expect(find.text(greetings.title), findsOneWidget);
  });

  test('grammar catalog has fourteen independent lessons and explained answers', () {
    expect(grammarLessons.length, 14);
    expect(grammarLessons.expand((l) => l.exercises).length, 112);
    for (final entry in answers.entries) {
      expect(entry.key.id.startsWith('grammar-'), true);
      expect(entry.key.section, 'Grammar basics');
      expect(entry.key.introduction, isNotEmpty);
      for (var i = 0; i < entry.value.length; i++) {
        final exercise = entry.key.exercises[i];
        expect(exercise.choices[exercise.answer], entry.value[i]);
        expect(exercise.explanation, isNotEmpty);
      }
    }
  });
}
