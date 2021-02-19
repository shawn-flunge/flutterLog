


import 'package:flutter/material.dart';

import 'interactiveTutorial.dart';
import '../../store.dart';

class FirstPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
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