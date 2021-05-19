import 'package:flutter/material.dart';

class TextControllerManager{
  TextControllerManager._privateConstructor();

  static final TextControllerManager _instance = TextControllerManager._privateConstructor();

  Map<String, TextEditingController> _textEditionControllerList = new Map();

  TextEditingController getTextEditionController(String controllerName, {String defaultText}){
    if(_textEditionControllerList[controllerName] == null){
      _textEditionControllerList.putIfAbsent(controllerName,
              () => new TextEditingController(text: defaultText == null ? "" : defaultText));
    }

    return _textEditionControllerList[controllerName];
  }

  static TextControllerManager get instance => _instance;
}