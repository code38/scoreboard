import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/controller/DisplayController.dart';
import 'package:scoreboard/controller/PersistenceController.dart';
import 'package:scoreboard/controller/ProcessController.dart';
import 'package:scoreboard/entity/Status.dart';
import 'package:scoreboard/widget/MainPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runner();
}

void runner() async {
  Status status = Status.instance;
  await status.initScoresUnFile();

  DisplayController displayController = new DisplayController();
  PersistenceController persistenceController = new PersistenceController();
  ProcessController processController = new ProcessController();

  WidgetEventDispatcher dispatcher = new WidgetEventDispatcher(
      displayController, persistenceController, processController);

  runApp(new MainPage(dispatcher));
}
