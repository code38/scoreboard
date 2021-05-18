import 'package:flutter/material.dart';
import 'package:scoreboard/entity/PlayerScore.dart';
import 'package:scoreboard/service/TextFieldManager.dart';
import 'package:scoreboard/utils/DisplayUtil.dart';
import 'package:scoreboard/widget/SubMission.dart';

class SubMissionState extends State<SubMission> {
  TextFieldManager _tfm;

  PlayerScore player;

  TextEditingController userNameController;
  TextEditingController the1stTurnScoreController;
  TextEditingController the2ndTurnScoreController;
  TextEditingController the3rdTurnScoreController;
  TextEditingController the1stMissionController;
  TextEditingController the2ndMissionController;
  TextEditingController the3rdMissionController;

  SubMissionState(TextFieldManager tfm, PlayerScore player, bool isUserPlayer) {
    this._tfm = tfm;
    this.player = player;
    this.player.isUser = isUserPlayer;

    if(this._tfm.getSubMissionState(player) == null){
      this._tfm.subMissionStates.putIfAbsent(player, () => this);
    } else {
      this._tfm.subMissionStates.update(player, (value) => this);
    }

    initBoard(this.player);
  }

  void initBoard(PlayerScore player){
    userNameController = new TextEditingController(text: player.playerName);
    the1stTurnScoreController = new TextEditingController(text: DisplayUtil.getDisplayVal(_tfm, player.subMission1Score));
    the2ndTurnScoreController = new TextEditingController(text: DisplayUtil.getDisplayVal(_tfm, player.subMission2Score));
    the3rdTurnScoreController = new TextEditingController(text: DisplayUtil.getDisplayVal(_tfm, player.subMission3Score));
    the1stMissionController = new TextEditingController(text: player.subMission1Desc);
    the2ndMissionController = new TextEditingController(text: player.subMission2Desc);
    the3rdMissionController = new TextEditingController(text: player.subMission3Desc);
  }

  @override
  Widget build(BuildContext context) {
    Row nameRow = new Row(children: [
      new Expanded(child: new TextField(controller: userNameController,), flex: 8,),
      new Expanded(child: new Text("是否是您"), flex: 3,),
      new Expanded(child: new Switch(value: /*player.isUser*/false, onChanged: (val){}))
    ],);
    Row the1stLine = buildNewRow(the1stMissionController, the1stTurnScoreController, DisplayUtil.getDisplayVal(_tfm, player.subMission1Score));
    Row the2ndLine = buildNewRow(the2ndMissionController, the2ndTurnScoreController, DisplayUtil.getDisplayVal(_tfm, player.subMission2Score));
    Row the3rdLine = buildNewRow(the3rdMissionController, the3rdTurnScoreController, DisplayUtil.getDisplayVal(_tfm, player.subMission3Score));

    Column c = new Column(children: [nameRow, the1stLine, the2ndLine, the3rdLine]);
    return c;
  }

  Row buildNewRow(TextEditingController missionNameController,
      TextEditingController turnScoreController,
      String score) {
    return new Row(
      children: [
        Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(labelText: "子任务描述"),
              controller: missionNameController,
            )),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                new Text("得分", style: TextStyle(fontSize: 10),),
                new Text(score, style: TextStyle(fontSize: 18),),
              ],
            )),
        Expanded(
          flex: 3,
          child: new Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: "本回合获得分数"
                  ),
                  keyboardType: TextInputType.number,
                  controller: turnScoreController
              )
          ),
        )
      ],
    );
  }
}
