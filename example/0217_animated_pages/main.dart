



import 'package:flutter/material.dart';

import 'childHero.dart';
import 'parentHero.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedEx2(title: '0217 Animation'),
    );
  }
}


class AnimatedEx2 extends StatefulWidget{
  final String title;
  AnimatedEx2({this.title});

  AnimatedEx2State createState() => AnimatedEx2State();
}

class AnimatedEx2State extends State<AnimatedEx2>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ParentHero(),
    );
  }

}

