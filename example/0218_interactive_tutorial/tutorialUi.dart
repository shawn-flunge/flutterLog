

import 'package:flutter/material.dart';

import 'interactiveTutorial.dart';
import 'store.dart';

class TutorialUI extends StatefulWidget{
  final String title;

  TutorialUI({this.title});
  TutorialUIState createState() => TutorialUIState();
}

class TutorialUIState extends State<TutorialUI>{

  GridView widgets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgets = buildGridView();
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: widgets,
    );
  }



  Widget buildGridView(){
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate( 
        wantList.length, 
        (index){
          return Container(
            child: InkWell(
              child: Hero(
                child: wantList[index].image,
                tag: wantList[index].title,
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return InteractiveTutorial(gogo: wantList[index]);
                }));
              },
            )
          );
        }
      ),
    );
  }


}