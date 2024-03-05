// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:your_app/widgets/your_widget.dart';

// void main() {
//   testWidgets('Widget should display text', (WidgetTester tester) async {
//     // Build the widget
//     await tester.pumpWidget(YourWidget(text: 'Hello'));

//     // Find the Text widget
//     expect(find.text('Hello'), findsOneWidget);
//   });

//   testWidgets('Widget should increment counter', (WidgetTester tester) async {
//     // Build the widget
//     await tester.pumpWidget(YourCounterWidget());

//     // Verify initial state
//     expect(find.text('0'), findsOneWidget);

//     // Tap on the increment button
//     await tester.tap(find.byKey(const Key('increment_button')));

//     // Rebuild the widget
//     await tester.pump();

//     // Verify updated state
//     expect(find.text('1'), findsOneWidget);
//   });
// }
