import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/entity/Status.dart';
import 'package:scoreboard/widget/state/TotalState.dart';

class MainPage extends StatefulWidget {
  WidgetEventDispatcher _widgetEventDispatcher;


  MainPage(this._widgetEventDispatcher);

  @override
  State<StatefulWidget> createState() {
    return TotalState(_widgetEventDispatcher);
  }
}