import 'package:flutter/material.dart';
import 'package:scoreboard/widget/SubMission.dart';

import 'TextFieldManager.dart';

class SubMissionState extends State<SubMission> {
  TextFieldManager _tfm;

  TextEditingController the1stTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the1stMissionController =
  new TextEditingController(text: '0');
  TextEditingController the2ndMissionController =
  new TextEditingController(text: '0');
  TextEditingController the3rdMissionController =
  new TextEditingController(text: '0');

  SubMissionState(TextFieldManager tfm) {
    this._tfm = tfm;
    _tfm.subMissionState = this;
  }

  @override
  Widget build(BuildContext context) {
    Row the1stLine = buildNewRow(the1stMissionController, the1stTurnScoreController, _tfm.scoreBoardState.sub1Score);
    Row the2ndLine = buildNewRow(the2ndMissionController, the2ndTurnScoreController, _tfm.scoreBoardState.sub2Score);
    Row the3rdLine = buildNewRow(the3rdMissionController, the3rdTurnScoreController, _tfm.scoreBoardState.sub3Score);

    Column c = new Column(children: [the1stLine, the2ndLine, the3rdLine]);
    return c;
  }

  Row buildNewRow(TextEditingController missionNameController,
      TextEditingController turnScoreController,
      int score) {
    return new Row(
      children: [
        Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(labelText: "子任务描述"),
              controller: missionNameController,
            )),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                new Text("得分", style: TextStyle(fontSize: 10),),
                new Text(score.toString(), style: TextStyle(fontSize: 18),),
              ],
            )),
        Expanded(
          flex: 3,
          child: new Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: "本回合获得分数"
                  ),
                  keyboardType: TextInputType.number,
                  controller: turnScoreController
              )
          ),
        )
      ],
    );
  }
}
