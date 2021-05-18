import 'package:flutter/material.dart';
import 'package:scoreboard/entity/Status.dart';
import 'package:scoreboard/widget/MainPage.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runner();
}

void runner() async{
  Status status = Status.instance;
  await status.initScoresUnFile();
  runApp(new MainPage(status));
}


