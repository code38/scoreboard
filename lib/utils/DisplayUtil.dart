import 'package:scoreboard/constant/ButtonName.dart';
import 'package:scoreboard/constant/InDisplay.dart';
import 'package:scoreboard/constant/InGame.dart';

class DisplayUtil{
  static String getDisplayVal(int inGame, int num){
    if(inGame != InGame.BEFORE_GAME) {
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

  static String nextTurnBottomName(int inGame, int turn){
    if(inGame == InGame.IN_GAME){
      if(turn == 10){
        return ButtonName.END_TURN;
      } else {
        return ButtonName.NEXT_TURN;
      }
    } else {
      if(inGame == InGame.BEFORE_GAME){
        return ButtonName.START_GAME;
      } else {
        return ButtonName.START_NEW_GAME;
      }
    }
  }

  static String getCurrTurnName(int inDisplay, int inGame, int turn, String playerName) {
    if(inDisplay == InDisplay.USER_PLAYER){
      return playerName;
    } else if(inDisplay == InDisplay.ENEMY_PLAYER){
      return playerName;
    } else {
      if (inGame == InGame.IN_GAME) {
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