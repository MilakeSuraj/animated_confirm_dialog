import 'package:animated_confirm_dialog/animated_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test cancel button action', (WidgetTester tester) async {
    // Build the widget tree for the test
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                // Show the custom dialog when button is pressed
                showCustomDialog(
                  context: tester.element(find.byType(Scaffold)),
                  onCancel: () {
                    // Dismiss the dialog when cancel is pressed
                    Navigator.of(tester.element(find.byType(Scaffold))).pop();
                  },
                  onConfirm: () {},
                );
              },
              child: const Text('Show Dialog'),
            ),
          ),
        ),
      ),
    );

    // Tap on the button to show the dialog
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle(); // Wait for the dialog to appear

    // Verify that the dialog is shown
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.text('Logout Confirmation'), findsOneWidget);
    expect(find.text('Are you sure you want to log out?'), findsOneWidget);

    // Test if the cancel button is present
    expect(find.text('Cancel'), findsOneWidget);

    // Tap on the Cancel button
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle(); // Wait for the dialog to dismiss

    // Verify that the dialog is dismissed
    expect(find.byType(Dialog),
        findsNothing); // Ensure dialog is no longer present
  });

  testWidgets('Test confirm button action', (WidgetTester tester) async {
    // Build the widget tree for the test
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                // Show the custom dialog when button is pressed
                showCustomDialog(
                  context: tester.element(find.byType(Scaffold)),
                  onCancel: () {},
                  onConfirm: () {
                    // Dismiss the dialog when confirm is pressed
                    Navigator.of(tester.element(find.byType(Scaffold))).pop();
                  },
                );
              },
              child: const Text('Show Dialog'),
            ),
          ),
        ),
      ),
    );

    // Tap on the button to show the dialog
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle(); // Wait for the dialog to appear

    // Verify that the dialog is shown
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.text('Logout Confirmation'), findsOneWidget);
    expect(find.text('Are you sure you want to log out?'), findsOneWidget);

    // Test if the confirm button is present
    expect(find.text('Logout'), findsOneWidget);

    // Tap on the Confirm button
    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle(); // Wait for the dialog to dismiss

    // Verify that the dialog is dismissed
    expect(find.byType(Dialog),
        findsNothing); // Ensure dialog is no longer present
  });
}
