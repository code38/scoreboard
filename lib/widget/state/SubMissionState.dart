import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/entity/SubMissionVO.dart';
import 'package:scoreboard/widget/SubMission.dart';

class SubMissionState extends State<SubMission> {
  WidgetEventDispatcher _widgetEventDispatcher;
  int _stateNum;

  SubMissionState(this._widgetEventDispatcher, this._stateNum);

  @override
  Widget build(BuildContext context) {
    SubMissionVO vo = _widgetEventDispatcher.getSubMissionValue(_stateNum);

    Row nameRow = new Row(
      children: [
        new Expanded(
          child: new TextField(
            controller: _widgetEventDispatcher
                .getTextEditionController("PlayerName-$_stateNum",
                defaultText: vo.playerName),
          ),
          flex: 7,
        ),
        new Expanded(
          child: new Text("是否是您"),
          flex: 3,
        ),
        new Expanded(
          child:
              new Switch(value: /*player.isUser*/ false, onChanged: null),
          flex: 2,
        )
      ],
    );
    Row line1 = buildNewRow(
        _widgetEventDispatcher.getTextEditionController(
            "SubMission1Name-$_stateNum",
            defaultText: vo.subMission1Name),
        _widgetEventDispatcher.getTextEditionController(
            "SubMission1Score-$_stateNum",
            defaultText: vo.subMission1TurnScore),
        vo.subMission1SumScore);
    Row line2 = buildNewRow(
        _widgetEventDispatcher.getTextEditionController(
            "SubMission2Name-$_stateNum",
            defaultText: vo.subMission2Name),
        _widgetEventDispatcher.getTextEditionController(
            "SubMission2Score-$_stateNum",
            defaultText: vo.subMission2TurnScore),
        vo.subMission2SumScore);
    Row line3 = buildNewRow(
        _widgetEventDispatcher.getTextEditionController(
            "SubMission3Name-$_stateNum",
            defaultText: vo.subMission3Name),
        _widgetEventDispatcher.getTextEditionController(
            "SubMission3Score-$_stateNum",
            defaultText: vo.subMission3TurnScore),
        vo.subMission3SumScore);

    Column c = new Column(children: [nameRow, line1, line2, line3]);
    return c;
  }

  Row buildNewRow(TextEditingController missionNameController,
      TextEditingController turnScoreController, String score) {
    turnScoreController.text = "0";

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
                new Text(
                  "得分",
                  style: TextStyle(fontSize: 10),
                ),
                new Text(
                  score,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )),
        Expanded(
          flex: 3,
          child: new Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                  decoration: InputDecoration(labelText: "本回合获得分数"),
                  keyboardType: TextInputType.number,
                  controller: turnScoreController)),
        )
      ],
    );
  }
}
