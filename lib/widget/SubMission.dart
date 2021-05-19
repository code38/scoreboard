import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/widget/state/SubMissionState.dart';


class SubMission extends StatefulWidget {
  WidgetEventDispatcher _widgetEventDispatcher;
  int _stateNum;


  SubMission(this._widgetEventDispatcher, this._stateNum);

  @override
  State<StatefulWidget> createState() => SubMissionState(_widgetEventDispatcher, _stateNum);
}

