import 'package:flutter/material.dart';
import 'package:scoreboard/State/ScoreBoardState.dart';
import 'package:scoreboard/entity/TextFieldManager.dart';

class ScoreBoard extends StatefulWidget {
  TextFieldManager _tfm;

  ScoreBoard(TextFieldManager textFieldManager) {
    this._tfm = textFieldManager;
    this._tfm.scoreBoardState = ScoreBoardState(_tfm);;
  }

  @override
  State<StatefulWidget> createState() => this._tfm.scoreBoardState;
}

