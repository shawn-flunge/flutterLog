import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimationEx(title: '0217 Animation'),
    );
  }
}

class AnimationEx extends StatefulWidget {
  final String title;
  AnimationEx({this.title});

  AnimationExState createState() => AnimationExState();
}

class AnimationExState extends State<AnimationEx> {

  var rnd = Random();

  //AnimatedContainer
  double acWidth = 100;
  double acHeight = 100;
  double acPadding = 10;
  double acMargin = 50;
  Color acColor = Colors.amber;
  
  //Opacity
  double opOpacity =1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            // buildOpacity(),
            // buildAnimatedOpacity(),
            buildAdvancedOpacity(),
            buildFadeInImage(),
            buildAnimatedContainer()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () {
          Future.delayed(Duration(seconds: 3),(){

            setState(() {
            acHeight = rnd.nextDouble() * 300;
            acWidth = rnd.nextDouble() * 300;
            acPadding = rnd.nextInt(30).toDouble();
            acMargin = rnd.nextInt(100).toDouble();
            acColor = Color.fromARGB(
                255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256));
            opOpacity = rnd.nextDouble();
          });

          });
          
        },
      ),
    );
  }

  Widget buildAnimatedContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: acWidth,
      height: acHeight,
      decoration: BoxDecoration(color: acColor),
      curve: Curves.easeInBack, // animation curve효과
      padding: EdgeInsets.all(acPadding),
      margin: EdgeInsets.only(top: acMargin),
      onEnd: () {
        print('duration만큼의 시간이 지나면 호출');
      },
      child: Container(
        child: Text('animated container'),
      ),
    );
  }





  Widget buildOpacity(){
    
    return Opacity(
      opacity: opOpacity,
      child: Container(
        width: 80,
        height: 80,
        color: Colors.black,
      ),
    );
  }

  Widget buildAnimatedOpacity(){

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opOpacity,
      child: Container( //child: Container(
        width: 200,
        height: 100,
        color: Colors.black,
      ),
    );
  }

  Widget buildAdvancedOpacity(){

    return Container(
      width: 200,
      height: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: AssetImage('assets/cambodia.jpeg'),fit: BoxFit.fitWidth,),
          buildAnimatedOpacity()
        ],
      ),
    );
  }


  Widget buildFadeInImage(){
    
    return FadeInImage(
      placeholder: Image(image: AssetImage('assets/Ellipse.png'),).image, 
      image: Image(image: AssetImage('assets/cambodia.jpeg'),).image, 
      fadeInCurve: Curves.bounceIn,
      fadeInDuration: Duration(milliseconds: 2000),
      fadeOutCurve: Curves.easeOut,
    );

    // return FadeInImage.assetNetwork(  //assetNetwork or memoryNetwork
    //   placeholder: 'assets/camboida.jpeg', 
    //   image: 'https://~~~'
    // );
  }


}
