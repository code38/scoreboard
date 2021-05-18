import 'package:scoreboard/widget/state/MainMissionState.dart';
import 'package:scoreboard/widget/state/ScoreBoardState.dart';
import 'package:scoreboard/widget/state/SubMissionState.dart';
import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/entity/PlayerScore.dart';
import 'package:scoreboard/entity/Status.dart';

class TextFieldManager{
  Status status;

  int inDisplay = InDisplay.TURN_PLAYER;

  MainMissionState mainMissionState;
  Map<PlayerScore, SubMissionState> subMissionStates = new Map();
  ScoreBoardState scoreBoardState;

  TextFieldManager(Status status){
    this.status = status;
  }

  void onClickNextTurnBottom(){
    if(status.turn != 11 && status.turn != 0 && status.turn != 10){
      nextTurn();
    } else if(status.turn == 10){
      endGame();
    } else if(status.turn == 0){
      startGame();
    } else if(status.turn == 11){
      startNewGame();
    }

    status.saveStatus();
  }

  void endGame(){
    status.turn++;
  }

  void startGame(){
    status.turn++;
  }

  void startNewGame(){
    status.resetStatus();
  }

  void nextTurn(){
    calcScore(status.getCurrPlayer());
    scoreBoardState.player = status.getNextPlayer();
    status.turn++;
  }

  void calcScore(PlayerScore player){
    int score = 0;

    if(status.turn > 2 && status.turn < 11) {
      if (getStatus("1")) {
        score += int.parse(mainMissionState.the1stScoreController.text);
      }
      if (getStatus("2")) {
        score += int.parse(mainMissionState.the2ndScoreController.text);
      }
      if (getStatus("3")) {
        score += int.parse(mainMissionState.the3rdScoreController.text);
      }

      player.mainMissionScore = score;
    }

    SubMissionState subMissionState = getSubMissionState(player);

    player.subMission1Score = int.parse(subMissionState.the1stTurnScoreController.text);
    player.subMission2Score = int.parse(subMissionState.the2ndTurnScoreController.text);
    player.subMission3Score = int.parse(subMissionState.the3rdTurnScoreController.text);
  }

  // void updateScoreBoard(PlayerScore player){
  //   scoreBoardState.mainScore = player.mainMissionScore;
  //   scoreBoardState.sub1Score = player.subMission1Score;
  //   scoreBoardState.sub2Score = player.subMission2Score;
  //   scoreBoardState.sub3Score = player.subMission3Score;
  //   scoreBoardState.totalScore = player.mainMissionScore +
  //                                 player.subMission1Score +
  //                                 player.subMission2Score +
  //                                 player.subMission3Score;
  // }

  void addLog(){

  }

  bool getStatus(String name){
    switch(name){
      case "1":
        return status.getCurrPlayer().the1stTargetSuccess;
      case "2":
        return status.getCurrPlayer().the2ndTargetSuccess;
      case "3":
        return status.getCurrPlayer().the3rdTargetSuccess;
      default:
        return null;
    }
  }

  void setStatus(String name, bool value){
    switch(name){
      case "1":
        status.getCurrPlayer().the1stTargetSuccess = value;
        break;
      case "2":
        status.getCurrPlayer().the2ndTargetSuccess = value;
        break;
      case "3":
        status.getCurrPlayer().the3rdTargetSuccess = value;
        break;
    }
  }

  bool inGame() {
    if(status.turn != 11 && status.turn != 0){
      return true;
    } else {
      return false;
    }
  }

  void switchDisplayScore() {
    if(inGame()){
      if(this.inDisplay == InDisplay.TURN_PLAYER){
        scoreBoardState.player = status.getUserPlayer();
        this.inDisplay = InDisplay.USER_PLAYER;
      } else if (this.inDisplay == InDisplay.USER_PLAYER){
        scoreBoardState.player = status.getEnemyPlayer();
        this.inDisplay = InDisplay.ENEMY_PLAYER;
      } else if(this.inDisplay == InDisplay.ENEMY_PLAYER){
        scoreBoardState.player = status.getCurrPlayer();
        this.inDisplay = InDisplay.TURN_PLAYER;
      }
    }
  }

  SubMissionState getSubMissionState(PlayerScore player){
    return subMissionStates[player];
  }
}