import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:scoreboard/entity/Status.dart';

class AbstractController{
  Status _status = Status.instance;
  Map<String, TextEditingController> _textEditionControllerList = new HashMap();

  TextEditingController getTextEditionController(String controllerName, {String defaultText}){
    if(_textEditionControllerList[controllerName] == null){
      _textEditionControllerList.putIfAbsent(controllerName,
              () => new TextEditingController(text: defaultText == null ? "" : defaultText));
    }

    return _textEditionControllerList[controllerName];
  }

  Status get status => _status;
}