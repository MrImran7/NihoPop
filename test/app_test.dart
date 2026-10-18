import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/lesson.dart';
import 'package:nihopop/progress.dart';

void main() {
  Future<void> tapVisible(WidgetTester tester, Finder button) async {
    if (button.evaluate().isEmpty) {
      await tester.scrollUntilVisible(button, 200, maxScrolls: 250);
    } else {
      await tester.ensureVisible(button);
    }
    await tester.pumpAndSettle();
    await tester.tap(button);
    await tester.pumpAndSettle();
  }

  testWidgets('complete a lesson and see saved progress on home', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(NihoPopApp(store: store));
    await tapVisible(tester, find.descendant(of: find.byKey(ValueKey('lesson-${greetings.id}')), matching: find.byType(FilledButton)));
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Let’s practice'));
    expect(tester.widget<FilledButton>(find.widgetWithText(FilledButton, 'Check answer')).onPressed, isNull);
    for (final answer in ['Hello', 'ありがとうございます', 'Good morning', 'ありがとう']) {
      await tapVisible(tester, find.widgetWithText(OutlinedButton, answer));
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
      expect(find.text('Correct!'), findsOneWidget);
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
    }
    expect(find.text('4 of 4 correct'), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(OutlinedButton, 'Back to lessons'));
    expect(find.text('Completed • Best: 4/4'), findsOneWidget);
  });

  testWidgets('hiragana scores separately and survives reopening', (tester) async {
    SharedPreferences.setMockInitialValues({
      'best.greetings-v1': 3,
      'completed.greetings-v1': true,
    });
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(NihoPopApp(store: store));
    final card = find.byKey(ValueKey('lesson-${hiraganaVowels.id}'));
    await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
    expect(find.text(hiraganaVowels.introduction), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Let’s practice'));
    // One deliberate mistake verifies feedback and a non-perfect score.
    final answers = ['i', 'i', 'u', 'e', 'o', 'あ', 'い', 'う', 'え', 'お'];
    for (var i = 0; i < answers.length; i++) {
      await tapVisible(tester, find.widgetWithText(OutlinedButton, answers[i]));
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
      expect(find.text(i == 0 ? 'Keep learning — here’s why:' : 'Correct!'), findsOneWidget);
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
    }
    expect(find.text('9 of 10 correct'), findsOneWidget);
    expect(store.best(greetings.id), 3);
    expect(store.best(hiraganaVowels.id), 9);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(NihoPopApp(
      store: ProgressStore(await SharedPreferences.getInstance()),
    ));
    await tester.pumpAndSettle();
    expect(find.text('Completed • Best: 3/4'), findsOneWidget);
    await tester.ensureVisible(card);
    await tester.pumpAndSettle();
    expect(find.text('Completed • Best: 9/10'), findsOneWidget);
    await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Let’s practice'));
    expect(find.text('Question 1 of 10'), findsOneWidget);
    // Abandoning a replay must not overwrite either saved score.
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(store.best(hiraganaVowels.id), 9);
    expect(store.best(greetings.id), 3);
  });

  for (final entry in {
    hiraganaK: ['ka', 'ki', 'ku', 'ke', 'ko', 'か', 'き', 'く', 'け', 'こ'],
    hiraganaS: ['sa', 'shi', 'su', 'se', 'so', 'さ', 'し', 'す', 'せ', 'そ'],
    hiraganaT: ['ta', 'chi', 'tsu', 'te', 'to', 'た', 'ち', 'つ', 'て', 'と'],
    hiraganaN: ['na', 'ni', 'nu', 'ne', 'no', 'な', 'に', 'ぬ', 'ね', 'の'],
    hiraganaH: ['ha', 'hi', 'fu', 'he', 'ho', 'は', 'ひ', 'ふ', 'へ', 'ほ'],
    hiraganaM: ['ma', 'mi', 'mu', 'me', 'mo', 'ま', 'み', 'む', 'め', 'も'],
    hiraganaY: ['ya', 'yu', 'yo', 'や', 'ゆ', 'よ'],
    hiraganaR: ['ra', 'ri', 'ru', 're', 'ro', 'ら', 'り', 'る', 'れ', 'ろ'],
    hiraganaWN: ['wa', 'wo', 'n', 'わ', 'を', 'ん'],
    hiraganaG: ['ga', 'gi', 'gu', 'ge', 'go', 'が', 'ぎ', 'ぐ', 'げ', 'ご'],
    hiraganaZ: ['za', 'ji', 'zu', 'ze', 'zo', 'ざ', 'じ', 'ず', 'ぜ', 'ぞ'],
    hiraganaD: ['da', 'ji', 'zu', 'de', 'do', 'だ', 'ぢ', 'づ', 'で', 'ど'],
    hiraganaB: ['ba', 'bi', 'bu', 'be', 'bo', 'ば', 'び', 'ぶ', 'べ', 'ぼ'],
    hiraganaP: ['pa', 'pi', 'pu', 'pe', 'po', 'ぱ', 'ぴ', 'ぷ', 'ぺ', 'ぽ'],
    yoonKG: ['kya', 'kyu', 'kyo', 'gya', 'gyu', 'gyo', 'きゃ', 'きゅ', 'きょ', 'ぎゃ', 'ぎゅ', 'ぎょ'],
    yoonSJ: ['sha', 'shu', 'sho', 'ja', 'ju', 'jo', 'しゃ', 'しゅ', 'しょ', 'じゃ', 'じゅ', 'じょ'],
    yoonCD: ['cha', 'chu', 'cho', 'ja', 'ju', 'jo', 'ちゃ', 'ちゅ', 'ちょ', 'ぢゃ', 'ぢゅ', 'ぢょ'],
    yoonNH: ['nya', 'nyu', 'nyo', 'hya', 'hyu', 'hyo', 'にゃ', 'にゅ', 'にょ', 'ひゃ', 'ひゅ', 'ひょ'],
    yoonMR: ['mya', 'myu', 'myo', 'rya', 'ryu', 'ryo', 'みゃ', 'みゅ', 'みょ', 'りゃ', 'りゅ', 'りょ'],
    yoonBP: ['bya', 'byu', 'byo', 'pya', 'pyu', 'pyo', 'びゃ', 'びゅ', 'びょ', 'ぴゃ', 'ぴゅ', 'ぴょ'],
    smallTsu: ['きって', 'kitte', 'がっこう', 'Three', 'ippai', 'つ'],
    longVowels: ['おかあさん', 'おにいさん', 'くうき', 'せんせい', 'とおい', 'Four'],
    particles: ['wa', 'e', 'o', 'ha', 'Two', 'shin\'you'],
    readingReview: ['neko', 'denwa', 'byouin', 'ryokou', 'ざっし', 'kyuu'],
  }.entries) {
    testWidgets('${entry.key.title} works on a phone-sized screen', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({
        'best.greetings-v1': 3, 'completed.greetings-v1': true,
        'best.hiragana-vowels-v1': 9, 'completed.hiragana-vowels-v1': true,
        for (final lesson in lessons.where((lesson) =>
            lesson != greetings && lesson != hiraganaVowels && lesson != entry.key)) ...{
          'best.${lesson.id}': lesson.exercises.length - 1,
          'completed.${lesson.id}': true,
        },
      });
      final store = ProgressStore(await SharedPreferences.getInstance());
      await tester.pumpWidget(NihoPopApp(store: store));
      final card = find.byKey(ValueKey('lesson-${entry.key.id}'));
      await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
      expect(find.text(entry.key.introduction), findsOneWidget);
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Let’s practice'));
      for (final answer in entry.value) {
        await tapVisible(tester, find.widgetWithText(OutlinedButton, answer));
        await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
        expect(find.text('Correct!'), findsOneWidget);
        await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
      }
      expect(find.text('${entry.value.length} of ${entry.value.length} correct'), findsOneWidget);
      await tapVisible(tester, find.widgetWithText(OutlinedButton, 'Back to lessons'));
      await tester.pumpWidget(const SizedBox.shrink());
      final reopened = ProgressStore(await SharedPreferences.getInstance());
      await tester.pumpWidget(NihoPopApp(store: reopened));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(card, 200, maxScrolls: 250);
      await tester.pumpAndSettle();
      expect(find.descendant(of: card, matching: find.text('Completed • Best: ${entry.value.length}/${entry.value.length}')), findsOneWidget);
      expect(reopened.best(greetings.id), 3);
      expect(reopened.best(hiraganaVowels.id), 9);
      for (final lesson in lessons.where((lesson) =>
          lesson != greetings && lesson != hiraganaVowels && lesson != entry.key)) {
        expect(reopened.best(lesson.id), lesson.exercises.length - 1);
        expect(reopened.completed(lesson.id), true);
      }
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('filter lesson groups and return to the selected group', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(NihoPopApp(store: store));
    await tapVisible(tester, find.byKey(const ValueKey('lesson-group')));
    await tester.tap(find.text('Reading rules').last);
    await tester.pumpAndSettle();
    expect(find.text(greetings.title), findsNothing);
    final card = find.byKey(ValueKey('lesson-${smallTsu.id}'));
    await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
    expect(find.text(smallTsu.introduction), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Reading rules'), findsOneWidget);
    expect(store.completed(smallTsu.id), false);
    await tapVisible(tester, find.byKey(const ValueKey('lesson-group')));
    await tester.tap(find.text('All lessons').last);
    await tester.pumpAndSettle();
    expect(find.text(greetings.title), findsOneWidget);
  });
}
