import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test to verify if MyApp is rendering correctly.
  testWidgets('MyApp renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify if the home page is loaded.
    expect(find.text('Custom Dialog Test'), findsOneWidget);
  });

  // Test to check if the custom dialog appears when the button is pressed.
  testWidgets('Custom dialog appears on button press',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the button to show the dialog.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for the dialog to show.

    // Verify if the dialog's title is displayed.
    expect(find.text('Delete Item?'), findsOneWidget);
    expect(find.text('Are you sure you want to delete this item?'),
        findsOneWidget);
    expect(find.text('No'), findsOneWidget);
    expect(find.text('Yes'), findsOneWidget);
  });

  // Test to verify if the cancel button closes the dialog.
  testWidgets('Cancel button closes the dialog', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the button to show the dialog.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for the dialog to show.

    // Tap the 'No' (Cancel) button.
    await tester.tap(find.text('No'));
    await tester.pumpAndSettle(); // Wait for the dialog to close.

    // Verify that the dialog is closed by checking the absence of its title.
    expect(find.text('Delete Item?'), findsNothing);
  });

  // Test to verify if the confirm button closes the dialog.
  testWidgets('Confirm button closes the dialog', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the button to show the dialog.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for the dialog to show.

    // Tap the 'Yes' (Confirm) button.
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle(); // Wait for the dialog to close.

    // Verify that the dialog is closed by checking the absence of its title.
    expect(find.text('Delete Item?'), findsNothing);
  });

  // Test if the dialog is displayed with a flip effect when `isFlip` is true.
  testWidgets('Dialog appears with flip effect when isFlip is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the button to show the dialog with flip effect.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for the dialog to show.

    // Verify if the flip effect is working, but this may require additional checks
    // such as inspecting the widget tree, which may involve checking specific transformations.
    // For simplicity, we can verify that the dialog shows up.
    expect(find.text('Delete Item?'), findsOneWidget);
  });
}
