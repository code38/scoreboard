import 'package:flutter/cupertino.dart';
import 'package:scoreboard/controller/DisplayController.dart';
import 'package:scoreboard/controller/PersistenceController.dart';
import 'package:scoreboard/controller/ProcessController.dart';
import 'package:scoreboard/utils/DisplayUtil.dart';

class WidgetEventDispatcher{
  DisplayController displayController;
  PersistenceController persistenceController;
  ProcessController processController;

  TextEditingController getTextEditingController(String controllerName, {String defaultText}){
    return displayController.getTextEditionController(controllerName, defaultText: defaultText);
  }

  void mainMissionTargetStatusUpdate(String targetName, bool val){

  }

  void toNextTurn(){

  }

  void onClickNextTurnBottom(){
    if(processController.status.turn != 11
        && processController.status.turn != 0
        && processController.status.turn != 10){
      processController.nextTurn();
    } else if(processController.status.turn == 10){
      processController.endGame();
    } else if(processController.status.turn == 0){
      processController.startGame();
    } else if(processController.status.turn == 11){
      processController.startNewGame();
    }

    processController.status.saveStatus();
  }
}