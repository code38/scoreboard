import 'package:flutter/material.dart';
import 'package:scoreboard/widget/ScoreBoard.dart';
import 'State/TextFieldManager.dart';
import 'widget/MainMission.dart';
import 'widget/SubMission.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TotalState();
  }
}

class TotalState extends State<MyApp> {
  TextFieldManager tfm = new TextFieldManager();

  @override
  Widget build(BuildContext context) {
    MainMission mainMission = new MainMission(tfm);
    SubMission subMission = new SubMission(tfm);
    ScoreBoard scoreBoard = new ScoreBoard(tfm);

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
                      makeNewBoard(subMission),
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


