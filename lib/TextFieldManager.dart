import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoreboard/PlayerScore.dart';

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

  PlayerScore player1 = new PlayerScore();
  PlayerScore player2 = new PlayerScore();

  bool the1stTargetSuccess = false;
  bool the2ndTargetSuccess = false;
  bool the3rdTargetSuccess = false;

  TextEditingController the1stScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdScoreController =
  new TextEditingController(text: '0');

  TextEditingController the1stTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the1stTotalScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndTotalScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdTotalScoreController =
  new TextEditingController(text: '0');

  TextEditingController cpController = new TextEditingController(text: '0');
  TextEditingController vpController = new TextEditingController(text: '0');

  bool if1stSuccess() => the1stTargetSuccess;
  bool if2ndSuccess() => the2ndTargetSuccess;
  bool if3rdSuccess() => the3rdTargetSuccess;

  void nextTurn(){
    PlayerScore thisPlayer = null;
    PlayerScore nextPlayer = null;
    if(turn != 11 && turn != 0){
      if(turn == 1 || turn % 2 == 1){
        thisPlayer = player1;
        nextPlayer = player2;
      } else {
        thisPlayer = player2;
        nextPlayer = player1;
      }
    }else if(turn != 0){
      if(player1.isUser){
        thisPlayer = player1;
        nextPlayer = player2;
      }else{
        thisPlayer = player2;
        nextPlayer = player1;
      }
    }

    calcScore(thisPlayer);
    resetInputArea();

    updateScoreBoard(nextPlayer);
  }

  void calcScore(PlayerScore player){

  }

  void resetInputArea(){

  }

  void updateScoreBoard(PlayerScore player){

  }

  void addLog(){

  }

  bool getStatus(String name){
    switch(name){
      case "1":
        return the1stTargetSuccess;
      case "2":
        return the2ndTargetSuccess;
      case "3":
        return the3rdTargetSuccess;
    }
  }

  bool setStatus(String name, bool status){
    switch(name){
      case "1":
        the1stTargetSuccess = status;
        break;
      case "2":
        the2ndTargetSuccess = status;
        break;
      case "3":
        the3rdTargetSuccess = status;
        break;
    }
  }
}