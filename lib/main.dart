import 'package:flutter/material.dart';
import 'MainMission.dart';
import 'SubMission.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TotalState();
  }
}

class TotalState extends State<MyApp> {
  TextEditingController cpController = new TextEditingController(text: '0');
  TextEditingController vpController = new TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    MainMission mainMission = new MainMission(vpController);
    SubMission subMission = new SubMission(vpController);

    return new MaterialApp(
      title: '40K Score Board',
      home: new Scaffold(
          appBar: new AppBar(
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
                      new Padding(
                        padding: EdgeInsets.all(5),
                        child: new Container(
                          decoration: new BoxDecoration(
                              borderRadius:
                              new BorderRadius.all(new Radius.circular(20.0)),
                              color: Colors.white54),
                          child: new Padding(
                            padding: EdgeInsets.all(20),
                            child: new Column(
                              children: [
                                new Row(children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: new TextField(
                                          keyboardType: TextInputType.number,
                                          controller: cpController,
                                          decoration: InputDecoration(
                                              labelText: "Command Point (CP)")))
                                ]),
                                new Row(children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: new TextField(
                                          keyboardType: TextInputType.number,
                                          controller: vpController,
                                          decoration: InputDecoration(
                                              labelText: "Victory Point (VP)")))
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(5),
                        child: new Container(
                          decoration: new BoxDecoration(
                              borderRadius:
                              new BorderRadius.all(new Radius.circular(20.0)),
                              color: Colors.white54),
                          child: new Padding(
                            padding: EdgeInsets.all(20),
                            child: new Column(
                              children: [mainMission],
                            ),
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(5),
                        child: new Container(
                          decoration: new BoxDecoration(
                              borderRadius:
                              new BorderRadius.all(new Radius.circular(20.0)),
                              color: Colors.white54),
                          child: new Padding(
                            padding: EdgeInsets.all(20),
                            child: new Column(
                              children: [subMission],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}




