import 'package:flutter/material.dart';
import 'package:scoreboard/State/SubMissionState.dart';
import 'package:scoreboard/entity/PlayerScore.dart';
import 'package:scoreboard/service/TextFieldManager.dart';


class SubMission extends StatefulWidget {
  TextFieldManager tfm;
  PlayerScore player;
  bool isUserPlayer;

  SubMission(TextFieldManager tfm, PlayerScore player, bool isUserPlayer) {
    this.tfm = tfm;
    this.player = player;
  }

  @override
  State<StatefulWidget> createState() => SubMissionState(tfm, player, isUserPlayer);
}

