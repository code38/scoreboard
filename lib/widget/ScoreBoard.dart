import 'package:flutter/material.dart';
import 'package:scoreboard/State/ScoreBoardState.dart';
import 'package:scoreboard/entity/TextFieldManager.dart';

class ScoreBoard extends StatefulWidget {
  TextFieldManager tfm;

  ScoreBoard(TextFieldManager textFieldManager) {
    this.tfm = textFieldManager;
  }

  @override
  State<StatefulWidget> createState() => ScoreBoardState(tfm);
}

