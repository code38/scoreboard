// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/controller/DisplayController.dart';
import 'package:scoreboard/controller/PersistenceController.dart';
import 'package:scoreboard/controller/ProcessController.dart';
import 'package:scoreboard/entity/Status.dart';

import 'package:scoreboard/main.dart';
import 'package:scoreboard/widget/MainPage.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Status status = Status.instance;
    await status.initScoresUnFile();

    DisplayController displayController = new DisplayController();
    PersistenceController persistenceController = new PersistenceController();
    ProcessController processController = new ProcessController();

    WidgetEventDispatcher dispatcher = new WidgetEventDispatcher(
        displayController, persistenceController, processController);
    await tester.pumpWidget(MainPage(dispatcher));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
