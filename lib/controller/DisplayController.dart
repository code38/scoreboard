import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/constant/InGame.dart';
import 'package:scoreboard/constant/TurnStatus.dart';
import 'package:scoreboard/controller/interface/AbstractController.dart';
import 'package:scoreboard/entity/MainMissionVO.dart';
import 'package:scoreboard/entity/PlayerScore.dart';
import 'package:scoreboard/entity/ScoreBoardVO.dart';
import 'package:scoreboard/entity/SubMissionVO.dart';
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
      scoreBoard.playerName = TurnStatus.END_TURN;
      scoreBoard.totalScore = "-";

      scoreBoard.mainMissionScore = "-";
      scoreBoard.subMission1Score = "-";
      scoreBoard.subMission2Score = "-";
      scoreBoard.subMission3Score = "-";

      scoreBoard.mainMissionName = "-";
      scoreBoard.subMission1Name = "-";
      scoreBoard.subMission2Name = "-";
      scoreBoard.subMission3Name = "-";
    } else {
      PlayerScore player = status.getPlayerByType(status.currentDisplayPlayer);

      scoreBoard.playerName = DisplayUtil.getCurrTurnName(
          status.currentDisplayPlayer, inGame(), status.turn,
          player.playerName);
      scoreBoard.totalScore = DisplayUtil.getDisplayVal(
          inGame(),
          player.mainMissionScore +
              player.subMission1Score +
              player.subMission2Score +
              player.subMission3Score);

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
