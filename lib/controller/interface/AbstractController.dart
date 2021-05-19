import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:scoreboard/entity/Status.dart';
import 'package:scoreboard/entity/TextControllerManager.dart';

class AbstractController {
  Status _status = Status.instance;
  TextControllerManager _controllerManager = TextControllerManager.instance;

  Status get status => _status;

  TextControllerManager get controllerManager => _controllerManager;

  TextEditingController getTextEditionController(String controllerName,
          {String defaultText}) =>
      _controllerManager.getTextEditionController(controllerName,
          defaultText: defaultText);
}
