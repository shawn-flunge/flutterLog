


import 'package:flutter/material.dart';

class StaggeredAnimation extends StatelessWidget{

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;

  StaggeredAnimation({Key key, this.controller}) :
  opacity = Tween<double>(
    //opacity 시작 0, 끝 1
    begin: 0.0,
    end: 1.0
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        //controller의 duration 0~10%
        0.0, 
        0.100,
        curve: Curves.ease
      )
    )
  ),
  width = Tween<double>(
    //width의 시작 100, 끝 200
    begin: 50.0,
    end: 100.0
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.100, 
        0.250,
        curve: Curves.ease
      )
    )
  ),
  height = Tween<double>(
    begin: 100.0,
    end: 200.0
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        //controller의 duration 0~10%
        0.250, 
        0.500,
        curve: Curves.ease
      )
    )
  ),
  borderRadius = Tween<BorderRadius>(
    begin: BorderRadius.circular(10.0),
    end: BorderRadius.circular(80)
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.500, 
        0.700,
        curve: Curves.ease
      )
    )
  ),
  padding = Tween<EdgeInsets>(
    begin: const EdgeInsets.only(bottom: 10.0),
    end: const EdgeInsets.only(bottom: 80.0)
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.700,
        0.800,
        curve: Curves.ease
      )
    )
  ),
  color = ColorTween( //ColorTween으로 바꾸면 됨 Tween은 int나 float같은 값을 변경할 때 씀, 다른 애들도 마찬가지겠지 
    begin: Colors.indigo[100],
    end: Colors.orange[500]
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.800, 
        0.900,
        curve: Curves.ease
      )
    )
  );
  

  @override
  Widget build(BuildContext context) {
    
    return AnimatedBuilder(
      animation: controller,
      builder: (context,child){
        return Container(
          padding: padding.value,
          child: Opacity(
            opacity: opacity.value,
            child: Container(
              width: width.value,
              height: height.value,
              decoration: BoxDecoration(
                color: color.value,
                border: Border.all(width: 5.0),
                borderRadius: borderRadius.value
              ),
              
            ),
          ),
        );
      },
    );
  }
  
}