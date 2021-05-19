import 'package:flutter/material.dart';
import 'package:scoreboard/bus/WidgetEventDispatcher.dart';
import 'package:scoreboard/widget/MainMission.dart';
import 'package:scoreboard/widget/MainPage.dart';
import 'package:scoreboard/widget/ScoreBoard.dart';
import 'package:scoreboard/widget/SubMission.dart';

class TotalState extends State<MainPage> {
  WidgetEventDispatcher _widgetEventDispatcher;

  TotalState(this._widgetEventDispatcher);

  @override
  Widget build(BuildContext context) {
    ScoreBoard scoreBoard = new ScoreBoard(_widgetEventDispatcher);
    MainMission mainMission = new MainMission(_widgetEventDispatcher);
    SubMission subMission1 = new SubMission(_widgetEventDispatcher, 1);
    SubMission subMission2 = new SubMission(_widgetEventDispatcher, 2);


    return new MaterialApp(
      title: '40K Score Board',
      home: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.blue,
            title: new Text('40K Score Board',
                textAlign: TextAlign.left),
          ),
          body: new Center(
              child: new Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: new Container(
                  width: 400,
                  child: new ListView(
                    children: [
                      makeNewBoard(scoreBoard),
                      makeNewBoard(mainMission),
                      makeNewBoard(subMission1),
                      makeNewBoard(subMission2),
                      makeNewBoard(new TextField(decoration: InputDecoration(labelText: "备注"),)),
                    ],
                  ),
                ),
              )
          )
      ),
    );
  }
}

Padding makeNewBoard(Widget widget){
  return new Padding(
    padding: EdgeInsets.all(5),
    child: new Container(
      decoration: new BoxDecoration(
          borderRadius:
          new BorderRadius.all(new Radius.circular(20.0)),
          color: Colors.white54),
      child: new Padding(
        padding: EdgeInsets.all(20),
        child: new Column(
          children: [widget],
        ),
      ),
    ),
  );
}