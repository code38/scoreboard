class PlayerScore{
  String playerName;
  bool isUser = false;
  int playerId = 0;

  int _mainMissionScore = 0;

  bool the1stTargetSuccess = false;
  bool the2ndTargetSuccess = false;
  bool the3rdTargetSuccess = false;

  int _subMission1Score = 0;
  int _subMission2Score = 0;
  int _subMission3Score = 0;

  String _subMission1Desc = "子任务1";
  String _subMission2Desc = "子任务2";
  String _subMission3Desc = "子任务3";

  PlayerScore(String playerName, int playerId, {bool isUser, }){
    this.playerName = playerName;
    this.playerId = playerId == null ? 0 : playerId;
    this.isUser = isUser == null ? false : isUser;
  }

  int get mainMissionScore => _mainMissionScore;

  set mainMissionScore(int value) {
    if(_mainMissionScore + value > 45){
      _mainMissionScore = 45;
    } else {
      _mainMissionScore += value;
    }
  }

  int get subMission3Score => _subMission3Score;

  set subMission3Score(int value) {
    if(_subMission3Score + value > 15){
      _subMission3Score = 15;
    } else {
      _subMission3Score += value;
    }
  }

  int get subMission2Score => _subMission2Score;

  set subMission2Score(int value) {
    if(_subMission2Score + value > 15){
      _subMission2Score = 15;
    } else {
      _subMission2Score += value;
    }
  }

  int get subMission1Score => _subMission1Score;

  set subMission1Score(int value) {
    if(_subMission1Score + value > 15){
      _subMission1Score = 15;
    } else {
      _subMission1Score += value;
    }
  }

  String get subMission3Desc => _subMission3Desc;

  set subMission3Desc(String value) {
    _subMission3Desc = value;
  }

  String get subMission2Desc => _subMission2Desc;

  set subMission2Desc(String value) {
    _subMission2Desc = value;
  }

  String get subMission1Desc => _subMission1Desc;

  set subMission1Desc(String value) {
    _subMission1Desc = value;
  }

  void fromJson(Map<String, dynamic> json) {
    this.playerName = json['playerName'];
    this.isUser = json['isUser'];
    this.mainMissionScore = json['_mainMissionScore'];
    this.subMission1Score = json['_subMission1Score'];
    this.subMission2Score = json['_subMission2Score'];
    this.subMission3Score = json['_subMission3Score'];
    this.subMission1Desc = json['_subMission1Desc'];
    this.subMission2Desc = json['_subMission2Desc'];
    this.subMission3Desc = json['_subMission3Desc'];
  }
}