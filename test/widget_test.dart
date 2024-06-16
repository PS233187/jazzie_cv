import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jazzies_cv/pages/my_experience.dart';
import 'package:lottie/lottie.dart';

void main() {
  testWidgets('MyExperiencePage UI Test', (WidgetTester tester) async {
    // Build MyExperiencePage and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: MyExperiencePage()));

    // Verify the AppBar title
    expect(find.text('My Experience'), findsOneWidget);

    // Verify the Lottie animation is present
    expect(find.byType(Lottie), findsOneWidget);

    // Verify the Skills header
    expect(find.text('Skills'), findsOneWidget);

    // Verify the presence of a specific skill
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('Figma'), findsOneWidget);
    expect(find.text('JavaScript'), findsOneWidget);
    expect(find.text('WordPress'), findsOneWidget);

    // Verify initial state of the popup explanation visibility
    expect(find.text('Experience'), findsNothing);

    // Tap the Lottie animation to show the popup explanation
    await tester.tap(find.byType(Lottie));
    await tester.pump();

    // Verify the popup explanation is visible
    expect(find.text('Experience'), findsOneWidget);

    // Verify the close button is present in the popup
    expect(find.byIcon(Icons.close), findsOneWidget);

    // Tap the close button to hide the popup explanation
    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();

    // Verify the popup explanation is not visible anymore
    expect(find.text('Experience'), findsNothing);
  });
}
