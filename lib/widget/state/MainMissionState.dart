import 'package:flutter/material.dart';
import 'package:scoreboard/service/TextFieldManager.dart';
import 'package:scoreboard/utils/DisplayUtil.dart';
import 'package:scoreboard/widget/MainMission.dart';


class MainMissionState extends State<MainMission> {
  TextFieldManager _tfm;

  TextEditingController the1stScoreController;
  TextEditingController the2ndScoreController;
  TextEditingController the3rdScoreController;
  TextEditingController the1stTargetController;
  TextEditingController the2ndTargetController;
  TextEditingController the3rdTargetController;

  TextEditingController mainMissionNameController;

  MainMissionState(TextFieldManager tfm) {
    this._tfm = tfm;
    _tfm.mainMissionState = this;

    the1stScoreController =
    new TextEditingController(text: DisplayUtil.getDisplayVal(_tfm, _tfm.status.the1stMissionTargetScore));
    the2ndScoreController =
    new TextEditingController(text: DisplayUtil.getDisplayVal(_tfm, _tfm.status.the3rdMissionTargetScore));
    the3rdScoreController =
    new TextEditingController(text: DisplayUtil.getDisplayVal(_tfm, _tfm.status.the3rdMissionTargetScore));

    the1stTargetController = new TextEditingController(text: DisplayUtil.getDisplayStr(_tfm.status.the1stMissionTargetName));
    the2ndTargetController = new TextEditingController(text: DisplayUtil.getDisplayStr(_tfm.status.the2ndMissionTargetName));
    the3rdTargetController = new TextEditingController(text: DisplayUtil.getDisplayStr(_tfm.status.the3rdMissionTargetName));

    mainMissionNameController =
    new TextEditingController(text: _tfm.status.mainMissionTargetName);
  }

  @override
  Widget build(BuildContext context) {
    Row the1stLine = buildNewRow("第一", "1", the1stScoreController, the1stTargetController, _tfm);
    Row the2ndLine = buildNewRow("第二", "2", the2ndScoreController, the2ndTargetController, _tfm);
    Row the3rdLine = buildNewRow("第三", "3", the3rdScoreController, the3rdTargetController, _tfm);

    Column c = new Column(children: [
      new Padding(
          child: new Row(
            children: [
              new Expanded(child: TextField(
                controller: mainMissionNameController,
                  decoration: InputDecoration(labelText: "主任务描述"),
              ),
                  flex: 8),
              new Expanded(child: MaterialButton(
                child: new Padding(
                  child:new Text("Roll一个"),
                  padding: EdgeInsets.only(left: 5),
                ),
                onPressed: null,
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

  Row buildNewRow(String s, String stateName,
      TextEditingController scoreController,
      TextEditingController targetController,
      TextFieldManager textFieldManager) {
    return new Row(
      children: [
        Expanded(
          flex: 6,
          child: new Padding(padding: EdgeInsets.only(right: 15),
              child: TextField(
                decoration: InputDecoration(labelText: s + "目标描述"),
                  controller: targetController
              )
          ),
        ),
        Expanded(
            flex: 4,
            child: TextField(
                decoration: InputDecoration(labelText: s + "目标分数"),
                keyboardType: TextInputType.number,
                controller: scoreController)),
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