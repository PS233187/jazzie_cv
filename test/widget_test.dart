import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:jazzies_cv/pages/about_me.dart';
import 'package:jazzies_cv/main.dart';

void main() {
  testWidgets('MyAboutmePage renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: MyAboutmePage(),
    ));

    // Verwacht dat 'About me' in de appbalk zit
    expect(find.text('About me'), findsOneWidget);

    // Verwacht dat 'Hi, its Jasmin!' ergens in de widget voorkomt
    expect(find.text('Hi, its Jasmin!'), findsOneWidget);

    // Verwacht dat de datum correct wordt weergegeven
    String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    expect(find.text(formattedDate), findsOneWidget);

    // Verwacht dat alle persoonlijke items correct worden weergegeven
    expect(find.text('Family'), findsOneWidget);
    expect(find.text('My dog'), findsOneWidget);
    expect(find.text('Creative'), findsOneWidget);
    expect(find.text('Working out'), findsOneWidget);
    expect(find.text('travel'), findsOneWidget);
  });
}
