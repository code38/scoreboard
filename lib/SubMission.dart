import 'package:flutter/material.dart';

import 'TextFieldManager.dart';

class SubMission extends StatefulWidget {
  TextFieldManager tfm;

  SubMission(TextFieldManager tfm) {
    this.tfm = tfm;
  }

  @override
  _SubMissionState createState() => _SubMissionState(tfm);
}

class _SubMissionState extends State<SubMission> {
  TextFieldManager tfm;

  _SubMissionState(TextFieldManager tfm) {
    this.tfm = tfm;
  }

  void addScore(int no) {
    switch (no) {
      case 1:
        int missionVP = int.parse(tfm.the1stTotalScoreController.value.text);
        missionVP += int.parse(tfm.the1stTurnScoreController.value.text);
        tfm.the1stTotalScoreController.text = missionVP.toString();

        int vp = int.parse(tfm.vpController.value.text);
        vp += int.parse(tfm.the1stTurnScoreController.value.text);
        tfm.vpController.text = vp.toString();
        break;
      case 2:
        int missionVP = int.parse(tfm.the2ndTotalScoreController.value.text);
        missionVP += int.parse(tfm.the2ndTurnScoreController.value.text);
        tfm.the2ndTotalScoreController.text = missionVP.toString();

        int vp = int.parse(tfm.vpController.value.text);
        vp += int.parse(tfm.the2ndTurnScoreController.value.text);
        tfm.vpController.text = vp.toString();
        break;
      case 3:
        int missionVP = int.parse(tfm.the3rdTotalScoreController.value.text);
        missionVP += int.parse(tfm.the3rdTurnScoreController.value.text);
        tfm.the3rdTotalScoreController.text = missionVP.toString();

        int vp = int.parse(tfm.vpController.value.text);
        vp += int.parse(tfm.the3rdTurnScoreController.value.text);
        tfm.vpController.text = vp.toString();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Row the1stLine = buildNewRow(tfm.the1stTotalScoreController, tfm.the1stTurnScoreController);
    Row the2ndLine = buildNewRow(tfm.the2ndTotalScoreController, tfm.the2ndTurnScoreController);
    Row the3rdLine = buildNewRow(tfm.the3rdTotalScoreController, tfm.the3rdTurnScoreController);

    Column c = new Column(children: [the1stLine, the2ndLine, the3rdLine]);
    return c;
  }

  Row buildNewRow(TextEditingController totalScoreController, TextEditingController turnScoreController) {
    return new Row(
      children: [
        Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(labelText: "子任务描述"),
            )),
        Expanded(
            flex: 3,
            child: TextField(
                decoration: InputDecoration(labelText: "子任务分数"),
                keyboardType: TextInputType.number,
                controller: totalScoreController,
                enabled: false,)),
        Expanded(
          flex: 3,
          child: new Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: "获得分数"
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
