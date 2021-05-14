import 'package:flutter/material.dart';
import 'package:scoreboard/widget/ScoreBoard.dart';

import 'TextFieldManager.dart';

class ScoreBoardState extends State<ScoreBoard> {
  TextFieldManager _tfm;

  int totalScore = 0;
  int mainScore = 0;
  int sub1Score = 0;
  int sub2Score = 0;
  int sub3Score = 0;

  ScoreBoardState(TextFieldManager textFieldManager) {
    this._tfm = textFieldManager;
    _tfm.scoreBoardState = this;
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
            _tfm.currTurn,
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
              getDisplayVal(totalScore),
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
                            _tfm.mainMissionState.mainMissionNameController.text,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        _tfm.subMissionState.the1stMissionController.text,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        _tfm.subMissionState.the2ndMissionController.text,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        _tfm.subMissionState.the3rdMissionController.text,
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
                        getDisplayVal(mainScore),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        getDisplayVal(sub1Score),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        getDisplayVal(sub2Score),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: new Text(
                        getDisplayVal(sub3Score),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  )
                ],
              )),
        ),
          MaterialButton(
            onPressed: () {
              setState(() {
                _tfm.onClickNextTurnBottom();
              });
            },
            color: Colors.blue,
            child: SizedBox(
              width: double.infinity,
              child: new Text(_tfm.nextTurnBottomName, textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }

  String getDisplayVal(int num){
    if(_tfm.inGame()) {
      return "$num";
    } else {
      return "-";
    }
  }

  void resetBoard(){
    mainScore = 0;
    sub1Score = 0;
    sub2Score = 0;
    sub3Score = 0;
    totalScore = 0;
  }
}
