import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nihopop/main.dart';
import 'package:nihopop/progress.dart';

void main() {
  testWidgets('complete a lesson and see saved progress on home', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(NihoPopApp(store: store));
    await tester.tap(find.text('Start lesson'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Let’s practice'));
    await tester.pumpAndSettle();
    expect(tester.widget<FilledButton>(find.widgetWithText(FilledButton, 'Check answer')).onPressed, isNull);
    for (final answer in ['Hello', 'ありがとうございます', 'Good morning', 'ありがとう']) {
      await tester.tap(find.widgetWithText(OutlinedButton, answer));
      await tester.pump();
      await tester.tap(find.text('Check answer'));
      await tester.pump();
      expect(find.text('Correct!'), findsOneWidget);
      await tester.ensureVisible(find.text('Continue'));
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
    }
    expect(find.text('4 of 4 correct'), findsOneWidget);
    await tester.tap(find.text('Back to lessons'));
    await tester.pumpAndSettle();
    expect(find.text('Completed • Best: 4/4'), findsOneWidget);
  });
}
