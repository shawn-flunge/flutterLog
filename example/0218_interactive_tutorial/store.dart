


import 'package:flutter/material.dart';

class WantToGo{

  String title;
  String subTitle;
  Image image;
  String content;
  bool isLiked = false;
  int like=0;

  WantToGo({this.title,this.subTitle,this.image,this.content});

  
  
}


List<WantToGo> wantList = [
  WantToGo(title: 'Angkor Wat',subTitle: 'Cambodia', image: Image(image: AssetImage('assets/cambodia.jpeg'),fit: BoxFit.fitHeight,),content: '캄보디아의 앙코르 와트 입니당'),
  WantToGo(title: 'Aurora',subTitle: 'Island',image: Image(image: AssetImage('assets/island.jpeg'),fit: BoxFit.fitHeight,),content: '아이슬란드의 오로라'),
  WantToGo(title: 'Gobi Desert',subTitle: 'Mongolia',image: Image(image: AssetImage('assets/mongol.jpeg'),fit: BoxFit.fitHeight,),content: '몽골의 고비사막'),
  WantToGo(title: 'Jeju',subTitle: 'Korea',image: Image(image: AssetImage('assets/jeju.jpeg'),fit: BoxFit.fitHeight,),content: '성산 일출봉인가?'),
];