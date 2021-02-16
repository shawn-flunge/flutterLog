

import 'package:flutter/material.dart';

import 'detailWidget.dart';

class DetailPage extends StatefulWidget{
  int selectedIndex;
  DetailPage({this.selectedIndex});

  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailPage'),
      ),
      body: DetailWidget(selectedIndex: widget.selectedIndex,),
    );
    
  }
}