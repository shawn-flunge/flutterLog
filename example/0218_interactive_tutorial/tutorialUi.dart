

import 'package:flutter/material.dart';

import 'pages/first/interactiveTutorial.dart';
import 'store.dart';

class TutorialUI extends StatefulWidget{
  final String title;

  TutorialUI({this.title});
  TutorialUIState createState() => TutorialUIState();
}

class TutorialUIState extends State<TutorialUI>{

  int _index =0;

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.notifications_none_outlined,color: Colors.black54,),
          iconSize: 30.0, 
          onPressed: (){
            print('notification icon was tapped');
          }
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 29.0,
            child: InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: Image(image: AssetImage('assets/cambodia.jpeg'),).image,
              ),
              onTap: (){
                print('circleAvatar was tapped');
              },
            ),
          )
        ],
        elevation: 1,
      ),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            label: '홈',
            icon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.star_border_rounded),
            ),
            activeIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.star),
            )
          ),
          BottomNavigationBarItem(
            label: '소식',
            icon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.stars_outlined),
            ),
            activeIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.stars),
            )
          ),
          BottomNavigationBarItem(
            label: '글쓰기',
            icon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.error_outline),
            ),
            activeIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.error),
            ),
          ),
          BottomNavigationBarItem(
            label: '동네',
            icon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.vpn_key_outlined)
            ),
            activeIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.vpn_key),
            )
          ),
          BottomNavigationBarItem(
            label: '산책',
            icon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.wb_cloudy_outlined),
            ),
            activeIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.wb_cloudy)
            )
          ),
        ],       
        onTap: (index){
          setState(() {
            _index=index;
          });
        },
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.12,
          fontStyle: FontStyle.normal,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.12,
          fontStyle: FontStyle.normal,
        ),
        //fixedColor: Color.fromARGB(255, 68, 68, 68),
        selectedItemColor: Color.fromARGB(255, 68, 68, 68),
        unselectedItemColor: Color.fromARGB(153, 68, 68, 68),
      ),
    );
  }



}