import 'package:flutter/material.dart';

import 'TextFieldManager.dart';

class MainMission extends StatefulWidget {
  TextFieldManager tfm;

  MainMission(TextFieldManager tfm) {
    this.tfm = tfm;
  }

  @override
  _MainMissionState createState() => _MainMissionState(tfm);
}

class _MainMissionState extends State<MainMission> {
  TextFieldManager tfm;

  _MainMissionState(TextFieldManager tfm) {
    this.tfm = tfm;
  }

  void calculateMainMissionScore() {
    int turnMainMissionScore = 0;
    if (tfm.the1stTargetSuccess) {
      turnMainMissionScore += int.parse(tfm.the1stScoreController.text);
    }
    if (tfm.the2ndTargetSuccess) {
      turnMainMissionScore += int.parse(tfm.the2ndScoreController.text);
    }
    if (tfm.the3rdTargetSuccess) {
      turnMainMissionScore += int.parse(tfm.the3rdScoreController.text);
    }

    int vp = int.parse(tfm.vpController.value.text);
    vp += turnMainMissionScore;
    tfm.vpController.text = vp.toString();

    setState(() {
      tfm.the1stTargetSuccess = false;
      tfm.the2ndTargetSuccess = false;
      tfm.the3rdTargetSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Row the1stLine = buildNewRow("第一", "1", tfm.the1stScoreController, tfm);

    Row the2ndLine = buildNewRow("第二", "2", tfm.the2ndScoreController, tfm);

    Row the3rdLine = buildNewRow("第三", "3", tfm.the3rdScoreController, tfm);

    Column c = new Column(children: [
      new Padding(
          child: new Row(
            children: [
              new Expanded(child: TextField(
                decoration: InputDecoration(labelText: "主任务描述")),
                  flex: 8),
              new Expanded(child: RaisedButton(
                child: new Padding(child:new Text("Roll一个（暂不可用）"), padding: EdgeInsets.only(left: 5),),
                onPressed: () {
                  calculateMainMissionScore();
                },
              ), flex: 4)
            ],
          ),
          padding: EdgeInsets.only(bottom: 5)),
      the1stLine,
      the2ndLine,
      the3rdLine,

    ]);
    return c;
  }

  Row buildNewRow(String s, String stateName, TextEditingController controller, TextFieldManager textFieldManager) {
    return new Row(
      children: [
        Expanded(
          flex: 6,
          child: new Padding(padding: EdgeInsets.only(right: 15),
              child: TextField(
                decoration: InputDecoration(labelText: s + "目标描述"),
              )
          ),
        ),
        Expanded(
            flex: 4,
            child: TextField(
                decoration: InputDecoration(labelText: s + "目标分数"),
                keyboardType: TextInputType.number,
                controller: controller)),
        Expanded(
            flex: 2,
            child: Checkbox(
              value: tfm.getStatus(stateName),
              onChanged: (bool value) {
                setState(() {
                  tfm.setStatus(stateName, value);
                });
              },
            ))
      ],
    );
  }
}