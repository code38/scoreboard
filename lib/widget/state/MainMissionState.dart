import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/entity/MainMissionVO.dart';
import 'package:scoreboard/service/TextFieldManager.dart';
import 'package:scoreboard/utils/DisplayUtil.dart';
import 'package:scoreboard/widget/MainMission.dart';

class MainMissionState extends State<MainMission> {
  WidgetEventDispatcher _widgetEventDispatcher;

  MainMissionState(WidgetEventDispatcher widgetEventDispatcher) {
    this._widgetEventDispatcher = widgetEventDispatcher;
  }

  @override
  Widget build(BuildContext context) {
    MainMissionVO vo = _widgetEventDispatcher.getMainMissionValue();

    Row the1stLine = buildNewRow("第一", 1,
        _widgetEventDispatcher.getTextEditionController("MainMissionScore1",
            defaultText: vo.target1Score),
        _widgetEventDispatcher.getTextEditionController("MainTargetScore1",
            defaultText: vo.target1Desc));
    Row the2ndLine = buildNewRow("第二", 2,
        _widgetEventDispatcher.getTextEditionController("MainMissionScore2",
            defaultText: vo.target2Score),
        _widgetEventDispatcher.getTextEditionController("MainTargetScore2",
            defaultText: vo.target2Desc));
    Row the3rdLine = buildNewRow("第三", 3,
        _widgetEventDispatcher.getTextEditionController("MainMissionScore3",
            defaultText: vo.target3Score),
        _widgetEventDispatcher.getTextEditionController("MainTargetScore3",
            defaultText: vo.target3Desc));

    Column c = new Column(children: [
      new Padding(
          child: new Row(
            children: [
              new Expanded(
                  child: TextField(
                    controller: _widgetEventDispatcher.getTextEditionController(
                        "MainMissionName",
                        defaultText: vo.mainMissionDesc),
                    decoration: InputDecoration(labelText: "主任务描述"),
                  ),
                  flex: 8),
              new Expanded(
                  child: MaterialButton(
                    child: new Padding(
                      child: new Text("Roll一个"),
                      padding: EdgeInsets.only(left: 5),
                    ),
                    onPressed: null,
                  ),
                  flex: 4)
            ],
          ),
          padding: EdgeInsets.only(bottom: 5)),
      the1stLine,
      the2ndLine,
      the3rdLine,
    ]);
    return c;
  }

  Row buildNewRow(
      String s,
      int targetNum,
      TextEditingController scoreController,
      TextEditingController targetController) {
    return new Row(
      children: [
        Expanded(
          flex: 6,
          child: new Padding(
              padding: EdgeInsets.only(right: 15),
              child: TextField(
                  decoration: InputDecoration(labelText: s + "目标描述"),
                  controller: targetController)),
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
              value: _widgetEventDispatcher.getMainTargetStatus(targetNum),
              onChanged: (bool value) {
                setState(() {
                  _widgetEventDispatcher.setMainTargetStatus(targetNum, value);
                });
              },
            ))
      ],
    );
  }
}
