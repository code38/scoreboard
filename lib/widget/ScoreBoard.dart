import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/widget/State/ScoreBoardState.dart';

class ScoreBoard extends StatefulWidget {
  WidgetEventDispatcher _widgetEventDispatcher;

  ScoreBoard(this._widgetEventDispatcher);

  @override
  State<StatefulWidget> createState() => ScoreBoardState(_widgetEventDispatcher);
}

