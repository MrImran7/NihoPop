import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/lesson.dart';
import 'package:nihopop/progress.dart';

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

Future<void> selectGroup(WidgetTester tester, String group) async {
  await tapVisible(tester, find.byKey(const ValueKey('lesson-group')));
  final item = find.text(group).last;
  await tester.scrollUntilVisible(item, 150,
      scrollable: find.byType(Scrollable).last);
  await tester.pumpAndSettle();
  await tester.tap(item);
  await tester.pumpAndSettle();
}

void main() {
  final answers = <Lesson, List<String>>{
    katakanaVowels: ['a', 'i', 'u', 'e', 'o', 'ア', 'イ', 'ウ', 'エ', 'オ'],
    katakanaK: ['ka', 'ki', 'ku', 'ke', 'ko', 'カ', 'キ', 'ク', 'ケ', 'コ'],
    katakanaS: ['sa', 'shi', 'su', 'se', 'so', 'サ', 'シ', 'ス', 'セ', 'ソ'],
    katakanaT: ['ta', 'chi', 'tsu', 'te', 'to', 'タ', 'チ', 'ツ', 'テ', 'ト'],
    katakanaN: ['na', 'ni', 'nu', 'ne', 'no', 'ナ', 'ニ', 'ヌ', 'ネ', 'ノ'],
    katakanaH: ['ha', 'hi', 'fu', 'he', 'ho', 'ハ', 'ヒ', 'フ', 'ヘ', 'ホ'],
    katakanaM: ['ma', 'mi', 'mu', 'me', 'mo', 'マ', 'ミ', 'ム', 'メ', 'モ'],
    katakanaY: ['ya', 'yu', 'yo', 'ヤ', 'ユ', 'ヨ'],
    katakanaR: ['ra', 'ri', 'ru', 're', 'ro', 'ラ', 'リ', 'ル', 'レ', 'ロ'],
    katakanaWN: ['wa', 'wo', 'n', 'ワ', 'ヲ', 'ン'],
    katakanaG: ['ga', 'gi', 'gu', 'ge', 'go', 'ガ', 'ギ', 'グ', 'ゲ', 'ゴ'],
    katakanaZ: ['za', 'ji', 'zu', 'ze', 'zo', 'ザ', 'ジ', 'ズ', 'ゼ', 'ゾ'],
    katakanaD: ['da', 'ji', 'zu', 'de', 'do', 'ダ', 'ヂ', 'ヅ', 'デ', 'ド'],
    katakanaB: ['ba', 'bi', 'bu', 'be', 'bo', 'バ', 'ビ', 'ブ', 'ベ', 'ボ'],
    katakanaP: ['pa', 'pi', 'pu', 'pe', 'po', 'パ', 'ピ', 'プ', 'ペ', 'ポ'],
    katakanaYoonKG: ['kya', 'kyu', 'kyo', 'gya', 'gyu', 'gyo', 'キャ', 'キュ', 'キョ', 'ギャ', 'ギュ', 'ギョ'],
    katakanaYoonSJ: ['sha', 'shu', 'sho', 'ja', 'ju', 'jo', 'シャ', 'シュ', 'ショ', 'ジャ', 'ジュ', 'ジョ'],
    katakanaYoonCD: ['cha', 'chu', 'cho', 'ja', 'ju', 'jo', 'チャ', 'チュ', 'チョ', 'ヂャ', 'ヂュ', 'ヂョ'],
    katakanaYoonNH: ['nya', 'nyu', 'nyo', 'hya', 'hyu', 'hyo', 'ニャ', 'ニュ', 'ニョ', 'ヒャ', 'ヒュ', 'ヒョ'],
    katakanaYoonMR: ['mya', 'myu', 'myo', 'rya', 'ryu', 'ryo', 'ミャ', 'ミュ', 'ミョ', 'リャ', 'リュ', 'リョ'],
    katakanaYoonBP: ['bya', 'byu', 'byo', 'pya', 'pyu', 'pyo', 'ビャ', 'ビュ', 'ビョ', 'ピャ', 'ピュ', 'ピョ'],
    katakanaF: ['fa', 'fi', 'fe', 'fo', 'ファ', 'フィ', 'フェ', 'フォ'],
    katakanaTD: ['ti', 'di', 'tu', 'du', 'ティ', 'ディ', 'トゥ', 'ドゥ'],
    katakanaE: ['she', 'je', 'che', 'ye', 'シェ', 'ジェ', 'チェ', 'イェ'],
    katakanaShapes: ['シ', 'ツ', 'ソ', 'ン', 'ク', 'ケ'],
    katakanaLength: ['kaa', 'kii', 'kuu', 'kee', 'koo', 'kappu', 'キット', 'Three'],
    katakanaReading: ['kamera', 'terebi', 'koohii', 'baggu', 'shatsu', 'firumu', 'paatii', 'チョコレート'],
  };

  for (final entry in answers.entries) {
    testWidgets('${entry.key.id}: complete on phone and preserve other scores', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({
        for (final lesson in lessons.where((lesson) => lesson != entry.key)) ...{
          'best.${lesson.id}': 1, 'completed.${lesson.id}': true,
        },
      });
      final store = ProgressStore(await SharedPreferences.getInstance());
      await tester.pumpWidget(MaterialApp(home: LessonPage(store: store, lesson: entry.key)));
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Let’s practice'));
      expect(tester.widget<FilledButton>(find.widgetWithText(FilledButton, 'Check answer')).onPressed, isNull);
      for (final answer in entry.value) {
        await tapVisible(tester, find.widgetWithText(OutlinedButton, answer));
        await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
        expect(find.text('Correct!'), findsOneWidget);
        await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
      }
      expect(find.text('${entry.value.length} of ${entry.value.length} correct'), findsOneWidget);
      expect(find.text('Review mistakes'), findsNothing);
      final reopened = ProgressStore(await SharedPreferences.getInstance());
      expect(reopened.best(entry.key.id), entry.value.length);
      expect(reopened.completed(entry.key.id), true);
      for (final lesson in lessons.where((lesson) => lesson != entry.key)) {
        expect(reopened.best(lesson.id), 1, reason: lesson.id);
        expect(reopened.completed(lesson.id), true);
      }
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('katakana picker opens a lesson and retains its group on return', (tester) async {
    SharedPreferences.setMockInitialValues({'best.hiragana-vowels-v1': 8, 'completed.hiragana-vowels-v1': true});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(NihoPopApp(store: store));
    await selectGroup(tester, 'Katakana basics');
    expect(find.text(greetings.title), findsNothing);
    final card = find.byKey(ValueKey('lesson-${katakanaVowels.id}'));
    await tapVisible(tester, find.descendant(of: card, matching: find.byType(FilledButton)));
    expect(find.text(katakanaVowels.introduction), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Katakana basics'), findsOneWidget);
    await selectGroup(tester, 'Katakana reading rules');
    expect(find.text(katakanaShapes.title), findsOneWidget);
    await selectGroup(tester, 'All lessons');
    expect(find.text(greetings.title), findsOneWidget);
    expect(store.best(hiraganaVowels.id), 8);
  });

  testWidgets('katakana mistakes review without changing either script score', (tester) async {
    SharedPreferences.setMockInitialValues({'best.hiragana-vowels-v1': 8, 'completed.hiragana-vowels-v1': true});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(MaterialApp(home: LessonPage(store: store, lesson: katakanaVowels)));
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Let’s practice'));
    final attempt = ['i', 'i', 'u', 'e', 'o', 'ア', 'イ', 'ウ', 'エ', 'オ'];
    for (final answer in attempt) {
      await tapVisible(tester, find.widgetWithText(OutlinedButton, answer));
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
      await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
    }
    expect(find.text('9 of 10 correct'), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Review mistakes'));
    expect(find.text('Question 1 of 1'), findsOneWidget);
    expect(find.text('Which romaji matches ア?'), findsOneWidget);
    await tapVisible(tester, find.widgetWithText(OutlinedButton, 'a'));
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Check answer'));
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Continue'));
    expect(find.text('Review complete!'), findsOneWidget);
    expect(store.best(katakanaVowels.id), 9);
    expect(store.best(hiraganaVowels.id), 8);
  });

  test('katakana teaching covers every basic and marked character', () {
    final expected = {
      'Katakana basics': 'ア イ ウ エ オ カ キ ク ケ コ サ シ ス セ ソ タ チ ツ テ ト ナ ニ ヌ ネ ノ ハ ヒ フ ヘ ホ マ ミ ム メ モ ヤ ユ ヨ ラ リ ル レ ロ ワ ヲ ン',
      'Katakana voiced': 'ガ ギ グ ゲ ゴ ザ ジ ズ ゼ ゾ ダ ヂ ヅ デ ド バ ビ ブ ベ ボ パ ピ プ ペ ポ',
      'Katakana combinations': 'キャ キュ キョ ギャ ギュ ギョ シャ シュ ショ ジャ ジュ ジョ チャ チュ チョ ヂャ ヂュ ヂョ ニャ ニュ ニョ ヒャ ヒュ ヒョ ミャ ミュ ミョ リャ リュ リョ ビャ ビュ ビョ ピャ ピュ ピョ',
      'Katakana loanwords': 'ファ フィ フェ フォ ティ ディ トゥ ドゥ シェ ジェ チェ イェ',
    };
    const prefix = 'Which romaji matches ';
    for (final entry in expected.entries) {
      final taught = [
        for (final lesson in katakanaLessons.where((lesson) => lesson.section == entry.key))
          for (final exercise in lesson.exercises)
            if (exercise.prompt.startsWith(prefix))
              exercise.prompt.substring(prefix.length, exercise.prompt.length - 1),
      ];
      expect(taught, unorderedEquals(entry.value.split(' ')), reason: entry.key);
    }
    expect(katakanaLessons.length, 27);
    expect(katakanaLessons.fold<int>(0, (sum, lesson) => sum + lesson.exercises.length), 260);
    expect(katakanaLessons.every((lesson) => lesson.id.startsWith('katakana-')), true);
  });
}
