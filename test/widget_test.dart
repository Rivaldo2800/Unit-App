import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_app_flutter/main.dart';

void main() {
  testWidgets('App launches and displays HomePage', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(UnitConverterApp());

    // Verify that the HomePage is displayed.
    expect(find.text('Unit Converter'), findsOneWidget);
    expect(find.text('Length'), findsOneWidget);
    expect(find.text('Temperature'), findsOneWidget);
    expect(find.text('Mass'), findsOneWidget);
  });
}
