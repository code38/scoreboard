import 'package:flutter/material.dart';
import 'package:scoreboard/entity/Status.dart';
import 'package:scoreboard/widget/state/TotalState.dart';

class MainPage extends StatefulWidget {
  Status status;

  MainPage(this.status);

  @override
  State<StatefulWidget> createState() {
    return TotalState(status);
  }
}