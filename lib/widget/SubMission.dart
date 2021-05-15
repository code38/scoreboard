import 'package:flutter/material.dart';
import 'package:scoreboard/State/SubMissionState.dart';
import 'package:scoreboard/entity/TextFieldManager.dart';


class SubMission extends StatefulWidget {
  TextFieldManager tfm;

  SubMission(TextFieldManager tfm) {
    this.tfm = tfm;
    this.tfm.subMissionState = SubMissionState(tfm);
  }

  @override
  State<StatefulWidget> createState() => this.tfm.subMissionState;
}
