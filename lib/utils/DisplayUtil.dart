import 'package:scoreboard/constant/ButtonName.dart';
import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/service/TextFieldManager.dart';

class DisplayUtil{
  static String getDisplayVal(TextFieldManager tfm, int num){
    if(tfm.inGame()) {
      return "$num";
    } else {
      return "-";
    }
  }

  static String getDisplayStr(String val){
    if(val == null) {
      return "-";
    } else {
      return val;
    }
  }

  static String nextTurnBottomName(TextFieldManager tfm){
    if(tfm.inGame()){
      if(tfm.status.turn == 10){
        return ButtonName.END_TURN;
      } else {
        return ButtonName.NEXT_TURN;
      }
    } else {
      if(tfm.status.turn == 0){
        return ButtonName.START_GAME;
      } else {
        return ButtonName.START_NEW_GAME;
      }
    }
  }

  static String getCurrTurnName(TextFieldManager tfm) {
    if(tfm.inDisplay == InDisplay.USER_PLAYER){
      return tfm.status.getUserPlayer().playerName;
    } else if(tfm.inDisplay == InDisplay.ENEMY_PLAYER){
      return tfm.status.getEnemyPlayer().playerName;
    } else {
      if (tfm.inGame()) {
        return InDisplay.TURN_DICT[tfm.status.turn]
            + "-"
            + tfm.status
                .getCurrPlayer()
                .playerName;
      } else {
        return InDisplay.TURN_DICT[tfm.status.turn];
      }
    }
  }
}