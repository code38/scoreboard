import 'package:flutter/material.dart';

class TextFieldManager{
  bool the1stTargetSuccess = false;
  bool the2ndTargetSuccess = false;
  bool the3rdTargetSuccess = false;

  TextEditingController the1stScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdScoreController =
  new TextEditingController(text: '0');

  TextEditingController the1stTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdTurnScoreController =
  new TextEditingController(text: '0');
  TextEditingController the1stTotalScoreController =
  new TextEditingController(text: '0');
  TextEditingController the2ndTotalScoreController =
  new TextEditingController(text: '0');
  TextEditingController the3rdTotalScoreController =
  new TextEditingController(text: '0');

  TextEditingController cpController = new TextEditingController(text: '0');
  TextEditingController vpController = new TextEditingController(text: '0');

  bool if1stSuccess() => the1stTargetSuccess;
  bool if2ndSuccess() => the2ndTargetSuccess;
  bool if3rdSuccess() => the3rdTargetSuccess;

  void modifyStatus()
}