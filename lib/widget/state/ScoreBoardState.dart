import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/entity/viewObject/ScoreBoardVO.dart';
import 'package:scoreboard/widget/ScoreBoard.dart';


class ScoreBoardState extends State<ScoreBoard> {
  WidgetEventDispatcher _widgetEventDispatcher;

  var _refreshSubscription;

  ScoreBoardState(WidgetEventDispatcher widgetEventDispatcher) {
    this._widgetEventDispatcher = widgetEventDispatcher;
    _refreshSubscription = _widgetEventDispatcher.eventBus.on<String>().listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScoreBoardVO scoreBoard = _widgetEventDispatcher.getScoreBoardValue();

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
                scoreBoard.playerName,
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
            child: Padding(child: new InkWell(
                onTap: (){setState(() {
                  _widgetEventDispatcher.switchDisplayScore();
                });},
                child: new Text(
                  scoreBoard.totalScore,
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
            ),
              padding: EdgeInsets.all(16),
            )
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
                            scoreBoard.mainMissionName,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            scoreBoard.subMission1Name,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            scoreBoard.subMission2Name,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            scoreBoard.subMission3Name,
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
                            scoreBoard.mainMissionScore,
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            scoreBoard.subMission1Score,
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            scoreBoard.subMission2Score,
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            scoreBoard.subMission3Score,
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
              _widgetEventDispatcher.nextTurn();
            });
          },
          color: Colors.blue,
          child: SizedBox(
            width: double.infinity,
            child: new Text(scoreBoard.buttonName, textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}
