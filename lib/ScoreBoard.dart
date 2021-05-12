
import 'package:flutter/material.dart';
import 'package:scoreboard/TextFieldManager.dart';

class ScoreBoard extends StatefulWidget{
  TextFieldManager tfm;

  ScoreBoard(TextFieldManager textFieldManager){
    this.tfm = textFieldManager;
  }

  @override
  State<StatefulWidget> createState() {
    return _ScoreBoardState();
  }
}

class _ScoreBoardState extends State<ScoreBoard>{
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Row(
          children: [new Text("当前回合")],
        ),
        new Row(
          children: [new Text("第一回合-上半(玩家A)")],
        ),
        new Row(
          children: [new Text("分数")],
        ),
        new Row(
          children: [new Text("21")],
        ),
        new Row(
          children: [
            Expanded(child: new Text("主任务")),
            Expanded(child: new Text("主任务"))
          ],
        )
      ],
    );
  }
}