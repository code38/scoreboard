import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/controller/interface/AbstractController.dart';
import 'package:scoreboard/entity/PlayerScore.dart';
import 'package:scoreboard/utils/DisplayUtil.dart';

class ProcessController extends AbstractController {
  void toNextTurn() {
    if (status.turn != 11 && status.turn != 0 && status.turn != 10) {
      nextTurn();
    } else if (status.turn == 10) {
      endGame();
    } else if (status.turn == 0) {
      startGame();
    } else if (status.turn == 11) {
      startNewGame();
    }

    status.saveStatus();
  }

  void startNewGame() {
    status.resetStatus();
  }

  void startGame() {
    saveMissionInfo();
    status.turn++;
  }

  void nextTurn() {
    calcScore(status.getCurrPlayer());
    status.currentDisplayPlayer = InDisplay.TURN_PLAYER;
    status.turn++;
  }

  void endGame() {
    status.turn++;
  }

  void calcScore(PlayerScore player) {
    int score = 0;

    if (status.turn > 2 && status.turn < 11) {
      if (status.getCurrPlayer().the1stTargetSuccess) {
        score += int.parse(getTextEditionController("MainTargetScore1").text);
      }
      if (status.getCurrPlayer().the2ndTargetSuccess) {
        score += int.parse(getTextEditionController("MainTargetScore2").text);
      }
      if (status.getCurrPlayer().the3rdTargetSuccess) {
        score += int.parse(getTextEditionController("MainTargetScore3").text);
      }

      player.mainMissionScore = score;
    }

    int stateNum = status.getCurrPlayer().playerId;

    player.subMission1Score = DisplayUtil.getValidValue(
        getTextEditionController("SubMission1Score-$stateNum").text);
    player.subMission2Score = DisplayUtil.getValidValue(
        getTextEditionController("SubMission2Score-$stateNum").text);
    player.subMission3Score = DisplayUtil.getValidValue(
        getTextEditionController("SubMission3Score-$stateNum").text);
  }

  void saveMissionInfo() {
    status.mainMissionTargetName = getTextEditionController("MainMissionName").text;
    status.the1stMissionTargetName = getTextEditionController("MainTargetDesc1").text;
    status.the2ndMissionTargetName = getTextEditionController("MainTargetDesc2").text;
    status.the3rdMissionTargetName = getTextEditionController("MainTargetDesc3").text;

    status.the1stMissionTargetScore = DisplayUtil.getValidValue(getTextEditionController("MainTargetScore1").text);
    status.the1stMissionTargetScore = DisplayUtil.getValidValue(getTextEditionController("MainTargetScore2").text);
    status.the1stMissionTargetScore = DisplayUtil.getValidValue(getTextEditionController("MainTargetScore3").text);

    Function loadPlayerInfo = (PlayerScore player){
      player.playerName = getTextEditionController("PlayerName-${player.playerId}").text;
      player.subMission1Desc = getTextEditionController("SubMission1Name-${player.playerId}").text;
      player.subMission2Desc = getTextEditionController("SubMission2Name-${player.playerId}").text;
      player.subMission3Desc = getTextEditionController("SubMission3Name-${player.playerId}").text;
    };

    loadPlayerInfo(status.getUserPlayer());
    loadPlayerInfo(status.getEnemyPlayer());
  }

  bool getMainTargetStatus(int targetNum) {
    if (targetNum == 1) {
      return status.getCurrPlayer().the1stTargetSuccess;
    } else if (targetNum == 2) {
      return status.getCurrPlayer().the2ndTargetSuccess;
    } else if (targetNum == 3) {
      return status.getCurrPlayer().the3rdTargetSuccess;
    } else {
      return null;
    }
  }

  void setMainTargetStatus(int targetNum, bool value) {
    if (targetNum == 1) {
      status.getCurrPlayer().the1stTargetSuccess = value;
    } else if (targetNum == 2) {
      status.getCurrPlayer().the2ndTargetSuccess = value;
    } else if (targetNum == 3) {
      status.getCurrPlayer().the3rdTargetSuccess = value;
    }
  }

  int getPlayerId(int inDisplay) {
    return status.getPlayerByType(inDisplay).playerId;
  }

  void endThisGame() {
    status.turn = 10;
    nextTurn();
  }
}
