import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/main.dart';
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
    await tapVisible(tester, find.widgetWithText(FilledButton, 'Start lesson'));
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
}
