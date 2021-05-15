class PlayerScore{
  String playerName;
  bool isUser = false;

  int _mainMissionScore = 0;

  int _subMission1Score = 0;
  int _subMission2Score = 0;
  int _subMission3Score = 0;

  PlayerScore(String playerName){
    this.playerName = playerName;
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
}