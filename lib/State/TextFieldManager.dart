import 'package:flutter/material.dart';
import 'MainMissionState.dart';
import 'PlayerScore.dart';
import 'ScoreBoardState.dart';
import 'SubMissionState.dart';

class TextFieldManager{
  int turn = 0;
  List<String> turnDict = [
    "游戏开始前",
    "第一回合上半",
    "第一回合下半",
    "第二回合上半",
    "第二回合下半",
    "第三回合上半",
    "第三回合下半",
    "第四回合上半",
    "第四回合下半",
    "第五回合上半",
    "第五回合下半",
    "结束"
  ];
  String currTurn;
  String nextTurnBottomName = "开始";

  PlayerScore player1 = new PlayerScore("玩家1");
  PlayerScore player2 = new PlayerScore("玩家2");

  MainMissionState mainMissionState;
  SubMissionState subMissionState;
  ScoreBoardState scoreBoardState;

  TextFieldManager(){
    currTurn = turnDict[turn];
  }

  void onClickNextTurnBottom(){
    if(turn != 11 && turn != 0 && turn != 10){
      nextTurn();
    } else if(turn == 10){
      endGame();
    } else if(turn == 0){
      startGame();
    } else if(turn == 11){
      startNewGame();
    }
  }

  void endGame(){
    currTurn = turnDict[++turn];
    nextTurnBottomName = "开始新一局";
  }

  void startGame(){
    nextTurnBottomName = "下一回合";
    nextTurn();
  }

  void startNewGame(){
    turn = 0;
    scoreBoardState.resetBoard();

    player1 = new PlayerScore("玩家1");
    player2 = new PlayerScore("玩家2");

    nextTurnBottomName = "开始";
  }

  void nextTurn(){
    PlayerScore thisPlayer;
    PlayerScore nextPlayer;

    if(turn == 1 || turn % 2 == 1){
      thisPlayer = player1;
      nextPlayer = player2;
    } else {
      thisPlayer = player2;
      nextPlayer = player1;
    }

    calcScore(thisPlayer);
    updateScoreBoard(nextPlayer);

    this.currTurn = turnDict[++turn] + "-" + nextPlayer.playerName;
  }

  void calcScore(PlayerScore player){
    int score = 0;

    if(turn > 2 && turn < 11) {
      if (mainMissionState.the1stTargetSuccess) {
        score += int.parse(mainMissionState.the1stScoreController.text);
      }
      if (mainMissionState.the2ndTargetSuccess) {
        score += int.parse(mainMissionState.the2ndScoreController.text);
      }
      if (mainMissionState.the3rdTargetSuccess) {
        score += int.parse(mainMissionState.the3rdScoreController.text);
      }

      player.mainMissionScore = score;
    }

    player.subMission1Score = int.parse(subMissionState.the1stTurnScoreController.text);
    player.subMission2Score = int.parse(subMissionState.the2ndTurnScoreController.text);
    player.subMission3Score = int.parse(subMissionState.the3rdTurnScoreController.text);
  }

  void updateScoreBoard(PlayerScore player){
    scoreBoardState.mainScore = player.mainMissionScore;
    scoreBoardState.sub1Score = player.subMission1Score;
    scoreBoardState.sub2Score = player.subMission2Score;
    scoreBoardState.sub3Score = player.subMission3Score;
    scoreBoardState.totalScore = player.mainMissionScore +
                                  player.subMission1Score +
                                  player.subMission2Score +
                                  player.subMission3Score;
  }

  void addLog(){

  }

  bool getStatus(String name){
    switch(name){
      case "1":
        return mainMissionState.the1stTargetSuccess;
      case "2":
        return mainMissionState.the2ndTargetSuccess;
      case "3":
        return mainMissionState.the3rdTargetSuccess;
    }
  }

  bool setStatus(String name, bool status){
    switch(name){
      case "1":
        mainMissionState.the1stTargetSuccess = status;
        break;
      case "2":
        mainMissionState.the2ndTargetSuccess = status;
        break;
      case "3":
        mainMissionState.the3rdTargetSuccess = status;
        break;
    }
  }

  bool inGame() {
    if(turn != 11 && turn != 0){
      return true;
    } else {
      return false;
    }
  }
}