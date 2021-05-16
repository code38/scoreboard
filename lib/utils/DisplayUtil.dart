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
}