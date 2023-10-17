import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_praktikum/my_app.dart';

void main() {
  testWidgets("Test MyApp", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyApp(),
    ));

    expect(find.text("Create New Contacts"), findsOneWidget);

    final nama = find.ancestor(of: find.text("Nama"), matching: find.byType(TextFormField));
    final no = find.ancestor(of: find.text("Nomor"), matching: find.byType(TextFormField));
    final button = find.byKey(const Key("Submit"));

    await tester.enterText(nama, "Dena Rizki");
    await tester.enterText(no, "089128517256");

    expect(button, findsOneWidget);
  });
}
