import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jazzies_cv/pages/home_page.dart';
import 'package:jazzies_cv/pages/my_experience.dart';

void main() {
  testWidgets('HomePage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Verify the initial text 'Welkom!' is present.
    expect(find.text('Welkom!'), findsOneWidget);

    // Tap on the first GestureDetector (assuming it navigates to MyExperiencePage).
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle(Duration(seconds: 1)); // Wait for animations to complete.

    // Verify that the navigation happened correctly.
    expect(find.byType(MyExperiencePage), findsOneWidget);

    // You can add more tests as needed to validate other aspects of the UI.

    // Example of checking a specific widget on MyExperiencePage if needed:
    // expect(find.text('My Experience Page'), findsOneWidget);
  });
}
