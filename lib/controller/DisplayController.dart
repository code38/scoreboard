import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/constant/InGame.dart';
import 'package:scoreboard/constant/TurnStatus.dart';
import 'package:scoreboard/controller/interface/AbstractController.dart';
import 'package:scoreboard/entity/PlayerScore.dart';
import 'package:scoreboard/entity/viewObject/MainMissionVO.dart';
import 'package:scoreboard/entity/viewObject/ScoreBoardVO.dart';
import 'package:scoreboard/entity/viewObject/SubMissionVO.dart';
import 'package:scoreboard/utils/DisplayUtil.dart';

// ignore: slash_for_doc_comments
/**
 *
 */
class DisplayController extends AbstractController {
  // ignore: slash_for_doc_comments
  /**
   *
   */
  ScoreBoardVO getScoreBoardValue() {
    ScoreBoardVO scoreBoard = new ScoreBoardVO();

    if(status.currentDisplayPlayer == InDisplay.TURN_PLAYER && inGame() == InGame.AFTER_GAME){
      PlayerScore winner = getTotalScore(status.player1) > getTotalScore(status.player2) ? status.player1 : status.player2;
      PlayerScore loser = getTotalScore(status.player1) < getTotalScore(status.player2) ? status.player1 : status.player2;

      scoreBoard.playerName = TurnStatus.END_TURN + ":" + winner.playerName + "胜";
      scoreBoard.totalScore = getTotalScore(winner).toString() + " : " + getTotalScore(loser).toString();

      scoreBoard.mainMissionScore = winner.mainMissionScore.toString() + " : " + loser.mainMissionScore.toString();
      scoreBoard.subMission1Score = winner.subMission1Score.toString() + " : " + loser.subMission1Score.toString();
      scoreBoard.subMission2Score = winner.subMission2Score.toString() + " : " + loser.subMission2Score.toString();
      scoreBoard.subMission3Score = winner.subMission3Score.toString() + " : " + loser.subMission3Score.toString();

      scoreBoard.mainMissionName = status.mainMissionTargetName;
      scoreBoard.subMission1Name = "子任务1";
      scoreBoard.subMission2Name = "子任务2";
      scoreBoard.subMission3Name = "子任务3";
    } else {
      PlayerScore player = status.getPlayerByType(status.currentDisplayPlayer);

      scoreBoard.playerName = DisplayUtil.getCurrTurnName(
          status.currentDisplayPlayer, inGame(), status.turn,
          player.playerName);
      scoreBoard.totalScore = DisplayUtil.getDisplayVal(
          inGame(),
          getTotalScore(player));

      scoreBoard.mainMissionScore =
          DisplayUtil.getDisplayVal(inGame(), player.mainMissionScore);
      scoreBoard.subMission1Score =
          DisplayUtil.getDisplayVal(inGame(), player.subMission1Score);
      scoreBoard.subMission2Score =
          DisplayUtil.getDisplayVal(inGame(), player.subMission2Score);
      scoreBoard.subMission3Score =
          DisplayUtil.getDisplayVal(inGame(), player.subMission3Score);

      scoreBoard.mainMissionName = status.mainMissionTargetName;
      scoreBoard.subMission1Name = player.subMission1Desc;
      scoreBoard.subMission2Name = player.subMission2Desc;
      scoreBoard.subMission3Name = player.subMission3Desc;
    }

    scoreBoard.buttonName =
        DisplayUtil.nextTurnBottomName(inGame(), status.turn);

    return scoreBoard;
  }

  int getTotalScore(PlayerScore player) {
    return player.mainMissionScore +
            player.subMission1Score +
            player.subMission2Score +
            player.subMission3Score;
  }

  MainMissionVO getMainMissionValue() {
    MainMissionVO mainMissionVO = new MainMissionVO();

    mainMissionVO.mainMissionDesc = status.mainMissionTargetName;
    mainMissionVO.target1Desc = status.the1stMissionTargetName;
    mainMissionVO.target2Desc = status.the2ndMissionTargetName;
    mainMissionVO.target3Desc = status.the3rdMissionTargetName;
    mainMissionVO.target1Score =
        DisplayUtil.getDisplayVal(inGame(), status.the1stMissionTargetScore);
    mainMissionVO.target2Score =
        DisplayUtil.getDisplayVal(inGame(), status.the2ndMissionTargetScore);
    mainMissionVO.target3Score =
        DisplayUtil.getDisplayVal(inGame(), status.the3rdMissionTargetScore);

    return mainMissionVO;
  }

  SubMissionVO getSubMissionValue(int playerId) {
    SubMissionVO subMissionVO = new SubMissionVO();

    PlayerScore player = status.getPlayerById(playerId);

    subMissionVO.playerName = player.playerName;
    subMissionVO.subMission1Name = player.subMission1Desc;
    subMissionVO.subMission2Name = player.subMission2Desc;
    subMissionVO.subMission3Name = player.subMission3Desc;
    subMissionVO.subMission1SumScore =
        DisplayUtil.getDisplayVal(inGame(), player.subMission1Score);
    subMissionVO.subMission2SumScore =
        DisplayUtil.getDisplayVal(inGame(), player.subMission1Score);
    subMissionVO.subMission3SumScore =
        DisplayUtil.getDisplayVal(inGame(), player.subMission1Score);
    subMissionVO.subMission1TurnScore = DisplayUtil.getDisplayVal(inGame(), 0);
    subMissionVO.subMission2TurnScore = DisplayUtil.getDisplayVal(inGame(), 0);
    subMissionVO.subMission3TurnScore = DisplayUtil.getDisplayVal(inGame(), 0);

    return subMissionVO;
  }

  void clearSubMissionInput(){
    Function clearInput = (PlayerScore playerScore){
      getTextEditionController("SubMission1Score-${playerScore.playerId}");
      getTextEditionController("SubMission2Score-${playerScore.playerId}");
      getTextEditionController("SubMission3Score-${playerScore.playerId}");
    };

    clearInput(status.getUserPlayer());
    clearInput(status.getEnemyPlayer());
  }

  void switchDisplayScore() {
    // if (inGame()) {
    //   if (status.currentDisplayPlayer == InDisplay.TURN_PLAYER) {
    //     status.currentDisplayPlayer = InDisplay.USER_PLAYER;
    //   } else if (status.currentDisplayPlayer == InDisplay.USER_PLAYER) {
    //     status.currentDisplayPlayer = InDisplay.ENEMY_PLAYER;
    //   } else if (status.currentDisplayPlayer == InDisplay.ENEMY_PLAYER) {
    //     status.currentDisplayPlayer = InDisplay.TURN_PLAYER;
    //   }
    // }

    if (status.currentDisplayPlayer == InDisplay.TURN_PLAYER) {
      status.currentDisplayPlayer = InDisplay.USER_PLAYER;
    } else if (status.currentDisplayPlayer == InDisplay.USER_PLAYER) {
      status.currentDisplayPlayer = InDisplay.ENEMY_PLAYER;
    } else if (status.currentDisplayPlayer == InDisplay.ENEMY_PLAYER) {
      status.currentDisplayPlayer = InDisplay.TURN_PLAYER;
    }
  }

  int inGame() {
    if (status.turn != 11 && status.turn != 0) {
      return InGame.IN_GAME;
    } else if (status.turn == 11){
      return InGame.AFTER_GAME;
    } else {
      return InGame.BEFORE_GAME;
    }
  }
}
