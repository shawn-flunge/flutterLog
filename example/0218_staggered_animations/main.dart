


import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'staggeredAnimation.dart';

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
      home: StaggeredEx(title: 'Staggered Animation'),
    );
  }
}

class StaggeredEx extends StatefulWidget{

  final String title;
  StaggeredEx({this.title});

  StaggeredExState createState() => StaggeredExState();
} 

class StaggeredExState extends State<StaggeredEx> with TickerProviderStateMixin{

  AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this //TickerProviderStateMixin을 mixin해야 문제가 없음
    );
  }

  Future<void> playAnimation() async{
    try{
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Future.delayed(Duration(seconds: 3),(){
            playAnimation();
          });
        },
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5))
            ),
            child: StaggeredAnimation(
              controller: controller
            ),
          ),
          
        ),
      ),
      
    );
  }
}