import 'package:flutter/material.dart';
import 'package:scoreboard/State/SubMissionState.dart';
import 'package:scoreboard/constant/ButttomName.dart';
import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/entity/PlayerScore.dart';
import 'package:scoreboard/service/TextFieldManager.dart';
import 'package:scoreboard/utils/DisplayUtil.dart';
import 'package:scoreboard/widget/ScoreBoard.dart';


class ScoreBoardState extends State<ScoreBoard> {
  TextFieldManager _tfm;
  PlayerScore player;

  ScoreBoardState(TextFieldManager textFieldManager) {
    this._tfm = textFieldManager;
    this._tfm.scoreBoardState = this;
  }

  @override
  Widget build(BuildContext context) {
    PlayerScore player = this.player;
    if(player == null) {
      player = _tfm.status.getCurrPlayer();
    }

    int totalScore = player.subMission3Score + player.subMission2Score
        + player.subMission1Score + player.mainMissionScore;

    this.player = null;
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
                getCurrTurnName(),
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
                  _tfm.switchDisplayScore();
                });},
                child: new Text(
                  DisplayUtil.getDisplayVal(_tfm, totalScore),
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
                            DisplayUtil.getDisplayStr(_tfm.status.mainMissionTargetName),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            DisplayUtil.getDisplayStr(player.subMission1Desc),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            DisplayUtil.getDisplayStr(player.subMission2Desc),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            DisplayUtil.getDisplayStr(player.subMission3Desc),
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
                            DisplayUtil.getDisplayVal(_tfm, player.mainMissionScore),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            DisplayUtil.getDisplayVal(_tfm, player.subMission1Score),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            DisplayUtil.getDisplayVal(_tfm, player.subMission2Score),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: new Text(
                            DisplayUtil.getDisplayVal(_tfm, player.subMission3Score),
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
            child: new Text(nextTurnBottomName(), textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }

  String nextTurnBottomName(){
    if(_tfm.inGame()){
      if(_tfm.status.turn == 10){
        return ButttomName.END_TURN;
      } else {
        return ButttomName.NEXT_TURN;
      }
    } else {
      if(_tfm.status.turn == 0){
        return ButttomName.START_GAME;
      } else {
        return ButttomName.START_NEW_GAME;
      }
    }
  }

  String getCurrTurnName() {
    if(_tfm.inDisplay == InDisplay.USER_PLAYER){
      return _tfm.status.getUserPlayer().playerName;
    } else if(_tfm.inDisplay == InDisplay.ENEMY_PLAYER){
      return _tfm.status.getEnemyPlayer().playerName;
    } else {
      if (_tfm.inGame()) {
        return InDisplay.TURN_DICT[_tfm.status.turn]
            + "-"
            + _tfm.status
                .getCurrPlayer()
                .playerName;
      } else {
        return InDisplay.TURN_DICT[_tfm.status.turn];
      }
    }
  }
}
