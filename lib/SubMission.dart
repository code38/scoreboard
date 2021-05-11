import 'package:flutter/material.dart';

class SubMission extends StatefulWidget {
  TextEditingController vpScoreController;

  SubMission(TextEditingController vpScoreController) {
    this.vpScoreController = vpScoreController;
  }

  @override
  _SubMissionState createState() => _SubMissionState(vpScoreController);
}

class _SubMissionState extends State<SubMission> {
  TextEditingController the1stTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the1stTotalScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndTotalScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdTotalScoreController =
  new TextEditingController(text: '0');
  TextEditingController vpScoreController;

  _SubMissionState(TextEditingController vpScoreController) {
    this.vpScoreController = vpScoreController;
  }

  void addScore(int no) {
    switch (no) {
      case 1:
        int missionVP = int.parse(the1stTotalScoreController.value.text);
        missionVP += int.parse(the1stTurnScoreController.value.text);
        the1stTotalScoreController.text = missionVP.toString();

        int vp = int.parse(vpScoreController.value.text);
        vp += int.parse(the1stTurnScoreController.value.text);
        vpScoreController.text = vp.toString();
        break;
      case 2:
        int missionVP = int.parse(the2ndTotalScoreController.value.text);
        missionVP += int.parse(the2ndTurnScoreController.value.text);
        the2ndTotalScoreController.text = missionVP.toString();

        int vp = int.parse(vpScoreController.value.text);
        vp += int.parse(the2ndTurnScoreController.value.text);
        vpScoreController.text = vp.toString();
        break;
      case 3:
        int missionVP = int.parse(the3rdTotalScoreController.value.text);
        missionVP += int.parse(the3rdTurnScoreController.value.text);
        the3rdTotalScoreController.text = missionVP.toString();

        int vp = int.parse(vpScoreController.value.text);
        vp += int.parse(the3rdTurnScoreController.value.text);
        vpScoreController.text = vp.toString();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Row the1stLine = new Row(
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
                controller: the1stTotalScoreController)),
        Expanded(
            flex: 2,
            child: new Padding(
                child: new RaisedButton(
                  child: new Text("+"),
                  onPressed: () {
                    addScore(1);
                  },
                ),
                padding: EdgeInsets.all(5.0))),
        Expanded(
            flex: 3,
            child: TextField(
                decoration: InputDecoration(labelText: "获得分数"),
                keyboardType: TextInputType.number,
                controller: the1stTurnScoreController))
      ],
    );

    Row the2ndLine = new Row(
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
                controller: the2ndTotalScoreController)),
        Expanded(
            flex: 2,
            child: new Padding(
                child: new RaisedButton(
                  child: new Text("+"),
                  onPressed: () {
                    addScore(2);
                  },
                ),
                padding: EdgeInsets.all(5.0))),
        Expanded(
            flex: 3,
            child: TextField(
                decoration: InputDecoration(labelText: "获得分数"),
                keyboardType: TextInputType.number,
                controller: the2ndTurnScoreController))
      ],
    );

    Row the3rdLine = new Row(
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
                controller: the3rdTotalScoreController)),
        Expanded(
            flex: 2,
            child: new Padding(
                child: new RaisedButton(
                  child: new Text("+"),
                  onPressed: () {
                    addScore(3);
                  },
                ),
                padding: EdgeInsets.all(5.0))),
        Expanded(
            flex: 3,
            child: TextField(
                decoration: InputDecoration(labelText: "获得分数"),
                keyboardType: TextInputType.number,
                controller: the3rdTurnScoreController))
      ],
    );

    Column c = new Column(children: [the1stLine, the2ndLine, the3rdLine]);
    return c;
  }
}