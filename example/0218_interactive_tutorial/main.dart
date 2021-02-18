

import 'package:flutter/material.dart';

import 'tutorialUi.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TutorialUI(title: '2월 셋째주 정리'),
    );   
  }
}
