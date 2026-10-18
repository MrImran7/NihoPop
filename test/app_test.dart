import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/lesson.dart';
import 'package:nihopop/progress.dart';

void main() {
  Future<void> tapVisible(WidgetTester tester, Finder button) async {
    await tester.ensureVisible(button);
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
}
