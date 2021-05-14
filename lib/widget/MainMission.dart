import 'package:flutter/material.dart';
import 'package:scoreboard/State/MainMissionState.dart';

import '../State/TextFieldManager.dart';

class MainMission extends StatefulWidget {
  TextFieldManager tfm;

  MainMission(TextFieldManager tfm) {
    this.tfm = tfm;
  }

  @override
  State<StatefulWidget> createState() => MainMissionState(tfm);
}
