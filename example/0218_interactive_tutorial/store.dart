


import 'package:flutter/material.dart';

import 'pages/fifth.dart';
import 'pages/first/first.dart';
import 'pages/fourth.dart';
import 'pages/second.dart';
import 'pages/third.dart';

class WantToGo{

  String title;
  String subTitle;
  Image image;
  String content;
  bool isLiked = false;
  int like=0;

  WantToGo({this.title,this.subTitle,this.image,this.content});

}


final List<WantToGo> wantList = [
  WantToGo(title: 'Angkor Wat',subTitle: 'Cambodia', image: Image(image: AssetImage('assets/cambodia.jpeg'),fit: BoxFit.fitHeight,),content: '캄보디아의 앙코르 와트 입니당'),
  WantToGo(title: 'Aurora',subTitle: 'Island',image: Image(image: AssetImage('assets/island.jpeg'),fit: BoxFit.fitHeight,),content: '아이슬란드의 오로라'),
  WantToGo(title: 'Gobi Desert',subTitle: 'Mongolia',image: Image(image: AssetImage('assets/mongol.jpeg'),fit: BoxFit.fitHeight,),content: '몽골의 고비사막'),
  WantToGo(title: 'Jeju',subTitle: 'Korea',image: Image(image: AssetImage('assets/jeju.jpeg'),fit: BoxFit.fitHeight,),content: '성산 일출봉인가?'),
];

final List<Widget> pages = [
  FirstPage(),
  SecondPage(),
  ThirdPage(),
  FourthPage(),
  FifthPage()
];

const Map<int, Color> customColor =
{
  50:Color.fromRGBO(255 ,255 ,255 , .1),
  100:Color.fromRGBO(255 ,255 ,255 , .2),
  200:Color.fromRGBO(255 ,255 ,255 , .3),
  300:Color.fromRGBO(255 ,255 ,255 , .4),
  400:Color.fromRGBO(255 ,255 ,255 , .5),
  500:Color.fromRGBO(255 ,255 ,255 , .6),
  600:Color.fromRGBO(255 ,255 ,255 , .7),
  700:Color.fromRGBO(255 ,255 ,255 , .8),
  800:Color.fromRGBO(255 ,255 ,255 , .9),
  900:Color.fromRGBO(255 ,255 ,255 , .1),
};