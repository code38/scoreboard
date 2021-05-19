import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/widget/state/MainMissionState.dart';


class MainMission extends StatefulWidget {
  WidgetEventDispatcher _widgetEventDispatcher;

  MainMission(WidgetEventDispatcher widgetEventDispatcher) {
    this._widgetEventDispatcher = widgetEventDispatcher;
  }

  @override
  State<StatefulWidget> createState() => MainMissionState(_widgetEventDispatcher);
}
