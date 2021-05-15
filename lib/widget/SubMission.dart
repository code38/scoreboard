import 'package:flutter/material.dart';
import 'package:scoreboard/State/SubMissionState.dart';
import 'package:scoreboard/entity/TextFieldManager.dart';


class SubMission extends StatefulWidget {
  TextFieldManager tfm;

  SubMission(TextFieldManager tfm) {
    this.tfm = tfm;
  }

  @override
  State<StatefulWidget> createState() => SubMissionState(tfm);
}

