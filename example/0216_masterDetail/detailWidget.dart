


import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget{
  int selectedIndex;
  DetailWidget({this.selectedIndex});

  DetailWidgetState createState() => DetailWidgetState();
}

class DetailWidgetState extends State<DetailWidget>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      child: Center(
        child: Text(widget.selectedIndex.toString()),
      ),
    );
    
  }
}