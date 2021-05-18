import 'package:scoreboard/controller/interface/AbstractController.dart';
import 'package:scoreboard/entity/PlayerScore.dart';

class ProcessController extends AbstractController{


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
}