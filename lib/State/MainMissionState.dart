
import 'package:flutter/material.dart';
import 'package:scoreboard/widget/MainMission.dart';

import 'TextFieldManager.dart';

class MainMissionState extends State<MainMission> {
  TextFieldManager _tfm;

  int _score = 0;

  bool the1stTargetSuccess = false;
  bool the2ndTargetSuccess = false;
  bool the3rdTargetSuccess = false;

  TextEditingController the1stScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdScoreController =
  new TextEditingController(text: '0');

  MainMissionState(TextFieldManager tfm) {
    this._tfm = tfm;
    _tfm.mainMissionState = this;
  }

  @override
  Widget build(BuildContext context) {
    Row the1stLine = buildNewRow("第一", "1", the1stScoreController, _tfm);
    Row the2ndLine = buildNewRow("第二", "2", the2ndScoreController, _tfm);
    Row the3rdLine = buildNewRow("第三", "3", the3rdScoreController, _tfm);

    Column c = new Column(children: [
      new Padding(
          child: new Row(
            children: [
              new Expanded(child: TextField(
                decoration: InputDecoration(labelText: "主任务描述")),
                  flex: 8),
              new Expanded(child: RaisedButton(
                child: new Padding(
                  child:new Text("Roll一个（暂不可用）"),
                  padding: EdgeInsets.only(left: 5),
                ),
                onPressed: () {

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
              value: _tfm.getStatus(stateName),
              onChanged: (bool value) {
                setState(() {
                  _tfm.setStatus(stateName, value);
                });
              },
            )
        )
      ],
    );
  }


}