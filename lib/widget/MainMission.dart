import 'package:flutter/material.dart';
import 'package:scoreboard/State/MainMissionState.dart';
import 'package:scoreboard/service/TextFieldManager.dart';


class MainMission extends StatefulWidget {
  TextFieldManager tfm;

  MainMission(TextFieldManager tfm) {
    this.tfm = tfm;
    this.tfm.mainMissionState = MainMissionState(tfm);
  }

  @override
  State<StatefulWidget> createState() => MainMissionState(tfm);
}
