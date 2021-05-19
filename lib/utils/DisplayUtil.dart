import 'package:scoreboard/constant/ButtonName.dart';
import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/service/TextFieldManager.dart';

class DisplayUtil{
  static String getDisplayVal(bool inGame, int num){
    if(inGame) {
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

  static String nextTurnBottomName(bool inGame, int turn){
    if(inGame){
      if(turn == 10){
        return ButtonName.END_TURN;
      } else {
        return ButtonName.NEXT_TURN;
      }
    } else {
      if(turn == 0){
        return ButtonName.START_GAME;
      } else {
        return ButtonName.START_NEW_GAME;
      }
    }
  }

  static String getCurrTurnName(int inDisplay, bool inGame, int turn, String playerName) {
    if(inDisplay == InDisplay.USER_PLAYER){
      return playerName;
    } else if(inDisplay == InDisplay.ENEMY_PLAYER){
      return playerName;
    } else {
      if (inGame) {
        return InDisplay.TURN_DICT[turn]
            + "-"
            + playerName;
      } else {
        return InDisplay.TURN_DICT[turn];
      }
    }
  }

  static int getValidValue(String context){
    return int.tryParse(context) ?? 0;
  }
}