import 'package:flutter/cupertino.dart';
import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/controller/DisplayController.dart';
import 'package:scoreboard/controller/PersistenceController.dart';
import 'package:scoreboard/controller/ProcessController.dart';
import 'package:scoreboard/entity/viewObject/MainMissionVO.dart';
import 'package:scoreboard/entity/viewObject/ScoreBoardVO.dart';
import 'package:scoreboard/entity/viewObject/SubMissionVO.dart';

class WidgetEventDispatcher {
  DisplayController _displayController;
  PersistenceController _persistenceController;
  ProcessController _processController;


  WidgetEventDispatcher(this._displayController, this._persistenceController,
      this._processController);

  TextEditingController getTextEditingController(String controllerName,
      {String defaultText}) {
    return _displayController.getTextEditionController(controllerName,
        defaultText: defaultText);
  }

  void mainMissionTargetStatusUpdate(String targetName, bool val) {}

  void nextTurn() {
    clearTurnStatus();
    _processController.toNextTurn();
  }

  void clearTurnStatus(){
    _displayController.clearSubMissionInput();
    setMainTargetStatus(1, false);
    setMainTargetStatus(2, false);
    setMainTargetStatus(3, false);
  }

  TextEditingController getTextEditionController(String controllerName,
      {String defaultText}) =>
      _processController.getTextEditionController(controllerName,
          defaultText: defaultText);

  ScoreBoardVO getScoreBoardValue(){
    return _displayController.getScoreBoardValue();
  }

  MainMissionVO getMainMissionValue(){
    return _displayController.getMainMissionValue();
  }

  SubMissionVO getSubMissionValue(int playerId){
    return _displayController.getSubMissionValue(playerId);
  }

  void switchDisplayScore() {
    _displayController.switchDisplayScore();
  }

  bool getMainTargetStatus(int targetNum) {
    return _processController.getMainTargetStatus(targetNum);
  }

  void setMainTargetStatus(int targetNum, bool value) {
    _processController.setMainTargetStatus(targetNum, value);
  }

  int getCurrentPlayerId(){
    return _processController.getPlayerId(InDisplay.TURN_PLAYER);
  }

  int getUserPlayerId(){
    return _processController.getPlayerId(InDisplay.USER_PLAYER);
  }

  int getEnemyPlayerId(){
    return _processController.getPlayerId(InDisplay.ENEMY_PLAYER);
  }
}
