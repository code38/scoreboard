import 'package:flutter/material.dart';

class MainMission extends StatefulWidget {
  TextEditingController vpScoreController = null;

  MainMission(TextEditingController vpScoreController) {
    this.vpScoreController = vpScoreController;
  }

  @override
  _MainMissionState createState() => _MainMissionState(vpScoreController);
}

class _MainMissionState extends State<MainMission> {
  bool the1stTargetSuccess = false;
  bool the2ndTargetSuccess = false;
  bool the3rdTargetSuccess = false;
  TextEditingController the1stScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdScoreController =
  new TextEditingController(text: '0');
  TextEditingController vpScoreController;

  _MainMissionState(TextEditingController vpScoreController) {
    this.vpScoreController = vpScoreController;
  }

  void calculateMainMissionScore() {
    int turnMainMissionScore = 0;
    if (the1stTargetSuccess) {
      turnMainMissionScore += int.parse(the1stScoreController.text);
    }
    if (the2ndTargetSuccess) {
      turnMainMissionScore += int.parse(the1stScoreController.text);
    }
    if (the3rdTargetSuccess) {
      turnMainMissionScore += int.parse(the1stScoreController.text);
    }

    int vp = int.parse(vpScoreController.value.text);
    vp += turnMainMissionScore;
    vpScoreController.text = vp.toString();

    setState(() {
      the1stTargetSuccess = false;
      the2ndTargetSuccess = false;
      the3rdTargetSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Row the1stLine = new Row(
      children: [
        Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(labelText: "第一目标描述"),
            )),
        Expanded(
            flex: 4,
            child: TextField(
                decoration: InputDecoration(labelText: "第一目标分数"),
                keyboardType: TextInputType.number,
                controller: the1stScoreController)),
        Expanded(
            flex: 2,
            child: Checkbox(
              value: this.the1stTargetSuccess,
              onChanged: (bool value) {
                setState(() {
                  this.the1stTargetSuccess = value;
                });
              },
            ))
      ],
    );

    Row the2ndLine = new Row(
      children: [
        Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(labelText: "第二目标描述"),
            )),
        Expanded(
            flex: 4,
            child: TextField(
                decoration: InputDecoration(labelText: "第二目标分数"),
                keyboardType: TextInputType.number,
                controller: the2ndScoreController)),
        Expanded(
            flex: 2,
            child: Checkbox(
              value: this.the2ndTargetSuccess,
              onChanged: (bool value) {
                setState(() {
                  this.the2ndTargetSuccess = value;
                });
              },
            ))
      ],
    );

    Row the3rdLine = new Row(
      children: [
        Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(labelText: "第三目标描述"),
            )),
        Expanded(
            flex: 4,
            child: TextField(
                decoration: InputDecoration(labelText: "第三目标分数"),
                keyboardType: TextInputType.number,
                controller: the3rdScoreController)),
        Expanded(
            flex: 2,
            child: Checkbox(
              value: this.the3rdTargetSuccess,
              onChanged: (bool value) {
                setState(() {
                  this.the3rdTargetSuccess = value;
                });
              },
            ))
      ],
    );

    Column c = new Column(children: [
      the1stLine,
      the2ndLine,
      the3rdLine,
      new Padding(
          child: new RaisedButton(
            child: new Text("计算"),
            onPressed: () {
              calculateMainMissionScore();
            },
          ),
          padding: EdgeInsets.all(20.0)),
    ]);
    return c;
  }
}