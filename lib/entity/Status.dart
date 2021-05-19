import 'dart:io';
import 'dart:convert';

import 'package:scoreboard/constant/InDisplay.dart';

import 'PlayerScore.dart';
import 'package:path_provider/path_provider.dart';

class Status{
  Status._privateConstructor();

  static final Status _instance = Status._privateConstructor();

  int _turn = 0;
  int currentDisplayPlayer = InDisplay.TURN_PLAYER;

  PlayerScore player1 = new PlayerScore("玩家1", 0, isUser: true);
  PlayerScore player2 = new PlayerScore("玩家2", 1);

  int player = 1;

  String mainMissionTargetName = "主任务描述";
  String the1stMissionTargetName = "1st目标描述";
  String the2ndMissionTargetName = "2nd目标描述";
  String the3rdMissionTargetName = "3rd目标描述";

  int the1stMissionTargetScore = 5;
  int the2ndMissionTargetScore = 5;
  int the3rdMissionTargetScore = 5;

  String remark = "";

  static Status get instance => _instance;

  void resetStatus() async{
    _turn = 0;
    player = 1;

    mainMissionTargetName = "主任务描述";
    the1stMissionTargetName = "1st目标描述";
    the2ndMissionTargetName = "2nd目标描述";
    the3rdMissionTargetName = "3rd目标描述";

    the1stMissionTargetScore = 5;
    the2ndMissionTargetScore = 5;
    the3rdMissionTargetScore = 5;

    remark = "";
    player1 = new PlayerScore("玩家1", 0, isUser: true);
    player2 = new PlayerScore("玩家2", 1);
    saveStatus();
  }

  void saveStatus() async {
    File file = await getCacheFile();
    file.writeAsString(JsonCodec().encode(this));
  }

  void initScoresUnFile() async {
    initScores(await getCacheFile());
  }

  void initScores(File file){
    if(file.existsSync()){
      String json = file.readAsStringSync();
      Map<String, dynamic>  map = JsonCodec().decode(json);
      this.fromJson(map);
    } else {
      file.createSync();
      saveStatus();
    }
  }

  Future<File> getCacheFile() async{
    String path = (await getApplicationDocumentsDirectory()).path + "/saver.json";
    File file = new File(path);
    return file;
  }

  void fromJson(Map<String, dynamic> json) {
    this._turn = json["turn"];
    this.mainMissionTargetName = json["mainMissionTargetName"];
    this.the1stMissionTargetName = json["the1stMissionTargetName"];
    this.the2ndMissionTargetName = json["the2ndMissionTargetName"];
    this.the3rdMissionTargetName = json["the3rdMissionTargetName"];
    this.the1stMissionTargetScore = json["the1stMissionTargetScore"];
    this.the2ndMissionTargetScore = json["the2ndMissionTargetScore"];
    this.the3rdMissionTargetScore = json["the3rdMissionTargetScore"];
    this.player1.fromJson(json["player1"]);
    this.player2.fromJson(json["player2"]);
  }

  Map<String, dynamic> toJson() => {
        'turn': _turn,
        'mainMissionTargetName': mainMissionTargetName,
        'the1stMissionTargetName': the1stMissionTargetName,
        'the2ndMissionTargetName': the2ndMissionTargetName,
        'the3rdMissionTargetName': the3rdMissionTargetName,
        'the1stMissionTargetScore': the1stMissionTargetScore,
        'the2ndMissionTargetScore': the2ndMissionTargetScore,
        'the3rdMissionTargetScore': the3rdMissionTargetScore,
        'player1': {
          'playerName':player1.playerName,
          'isUser':player1.isUser,
          'isUser':player1.isUser,
          '_mainMissionScore':player1.mainMissionScore,
          '_subMission1Score':player1.subMission1Score,
          '_subMission2Score':player1.subMission2Score,
          '_subMission3Score':player1.subMission3Score,
          '_subMission1Desc':player1.subMission1Desc,
          '_subMission2Desc':player1.subMission2Desc,
          '_subMission3Desc':player1.subMission3Desc,
        },
        'player2': {
          'playerName':player2.playerName,
          'isUser':player2.isUser,
          '_mainMissionScore':player2.mainMissionScore,
          '_subMission1Score':player2.subMission1Score,
          '_subMission2Score':player2.subMission2Score,
          '_subMission3Score':player2.subMission3Score,
          '_subMission1Desc':player2.subMission1Desc,
          '_subMission2Desc':player2.subMission2Desc,
          '_subMission3Desc':player2.subMission3Desc,
        },
      };

  PlayerScore getPlayerByType(int inDisplay){
    if(currentDisplayPlayer == InDisplay.TURN_PLAYER){
      return getCurrPlayer();
    } else if (currentDisplayPlayer == InDisplay.USER_PLAYER){
      return getUserPlayer();
    } else if (currentDisplayPlayer == InDisplay.ENEMY_PLAYER){
      return getEnemyPlayer();
    }
    return null;
  }

  PlayerScore getCurrPlayer() {
    if(_turn == 0 || _turn == 11){
      return getUserPlayer();
    }
    if(_turn == 1 || _turn % 2 == 1){
      return player1;
    } else {
      return player2;
    }
  }

  PlayerScore getNextPlayer() {
    if(_turn == 1 || _turn % 2 == 1){
      return player2;
    } else {
      return player1;
    }
  }

  PlayerScore getUserPlayer() {
    if(player == 1){
      return player1;
    } else {
      return player2;
    }
  }

  PlayerScore getEnemyPlayer() {
    if(player == 2){
      return player1;
    } else {
      return player2;
    }
  }

  int get turn => _turn;

  set turn(int value) {
    if(value > 11){
      _turn = 0;
    }
    _turn = value;
  }
}