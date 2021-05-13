import 'package:flutter/material.dart';
import 'package:scoreboard/TextFieldManager.dart';

class ScoreBoard extends StatefulWidget {
  TextFieldManager tfm;

  ScoreBoard(TextFieldManager textFieldManager) {
    this.tfm = textFieldManager;
  }

  @override
  State<StatefulWidget> createState() {
    return _ScoreBoardState(tfm);
  }
}

class _ScoreBoardState extends State<ScoreBoard> {
  TextFieldManager tfm;

  _ScoreBoardState(TextFieldManager textFieldManager) {
    this.tfm = textFieldManager;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Align(
          child: new Text(
            "当前回合",
            style: TextStyle(fontSize: 10, color: Colors.grey),
            textAlign: TextAlign.left,
          ),
          alignment: Alignment.centerLeft,
        ),
        Center(
            child: Padding(
          child: new Text(
            "第一回合-上半(玩家A)",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.all(16),
        )),
        Align(
          alignment: Alignment.centerLeft,
          child: new Text(
            "分数",
            style: TextStyle(fontSize: 10, color: Colors.grey),
            textAlign: TextAlign.left,
          ),
        ),
        Center(
          child: Padding(
            child: new Text(
              "21",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(16),
          ),
        ),
        Center(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: new Column(
                children: [
                  new Row(
                    children: [
                      Expanded(
                          child: new Text(
                        "主任务",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        "子任务1",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        "子任务2",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        "子任务3",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                  new Row(
                    children: [
                      Expanded(
                          child: new Text(
                        "15",
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        "10",
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        "5",
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        "0",
                        textAlign: TextAlign.center,
                      )),
                    ],
                  )
                ],
              )),
        ),
          MaterialButton(
            onPressed: () {tfm.nextTurn();},
            color: Colors.blue,
            child: SizedBox(
              width: double.infinity,
              child: new Text("下一回合",textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}
