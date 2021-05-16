import 'package:flutter/material.dart';
import 'package:scoreboard/State/ScoreBoardState.dart';
import 'package:scoreboard/service/TextFieldManager.dart';

class ScoreBoard extends StatefulWidget {
  TextFieldManager _tfm;

  ScoreBoard(TextFieldManager textFieldManager) {
    this._tfm = textFieldManager;
  }

  @override
  State<StatefulWidget> createState() => ScoreBoardState(_tfm);
}

