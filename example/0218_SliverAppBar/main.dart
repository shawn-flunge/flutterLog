

import 'package:flutter/material.dart';

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
      home: SliverPage(title: 'Sliver'),
    );
  }
}


class SliverPage extends StatelessWidget{
  final String title;
  SliverPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title)
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true, //축소시 상단에 appbar고정 여부
            expandedHeight: 200, //최대 높이
            flexibleSpace: FlexibleSpaceBar(  //늘어나는 영역
              title: Text('sliver title'),
              background: Image(image: AssetImage('assets/cambodia.jpeg'),fit: BoxFit.fill,),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text('Sliver content')
            ),
          )
        ],
      ),

    );
    
  }

}