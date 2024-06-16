import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

    // Verwacht dat 'Personal stuff' ergens in de widget voorkomt
    expect(find.text('Personal stuff'), findsOneWidget);

    // Verwacht dat 'Hi, its Jasmin!' ergens in de widget voorkomt
    expect(find.text('Hi, its Jasmin!'), findsOneWidget);

    // Verwacht niet dat de datum of andere items worden getest

  });
}
