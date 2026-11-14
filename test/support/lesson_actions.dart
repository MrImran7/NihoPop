import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nihopop/lesson.dart';

Future<void> selectLessonGroup(WidgetTester tester, String group) async {
  final field = find.byKey(const ValueKey('lesson-group'));
  final current =
      tester.widget<DropdownButtonFormField<String>>(field).initialValue;
  final delta = lessonSections.indexOf(group) <
          lessonSections.indexOf(current!)
      ? -150.0
      : 150.0;
  await tester.ensureVisible(field);
  await tester.tap(field);
  await tester.pumpAndSettle();
  final menu = find.byType(Scrollable).last;
  final item = find.descendant(of: menu, matching: find.text(group));
  await tester.scrollUntilVisible(item, delta,
      scrollable: menu, maxScrolls: 50);
  await tester.pumpAndSettle();
  await tester.tap(item);
  await tester.pumpAndSettle();
}
