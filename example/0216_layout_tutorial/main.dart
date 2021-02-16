import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const String dummyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
const TextStyle textStyleInUtil = TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.0
                                  );

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LayoutTutorial(title: '0216 layout tutorial'),
    );
  }
}


class LayoutTutorial extends StatefulWidget{

  final String title;
  LayoutTutorial({this.title});

  LayoutTutorialState createState() => LayoutTutorialState();
}

class LayoutTutorialState extends State<LayoutTutorial>{

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            mainImage,
            title,
            util,
            content
          ],
        ),
      ),
    );
  }


  Widget mainImage = Container(
    child: Image(image: AssetImage('assets/cambodia.jpeg'),fit: BoxFit.fitWidth,),
  );

  Widget title = Container(
    margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
    padding: const EdgeInsets.all(10),
    child: Row(

      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Angkor Wat',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0
                  ),
                )
              ),
              Text('Krong Siem Reap, Cambodia',
                style: const TextStyle(
                  color: Colors.grey
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red,
        ),
        Text('96')
      ],
    ),
  );

  Widget util = Container(
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    padding: const EdgeInsets.all(10),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Icon(
                Icons.call,
                size: 35,
                color: Colors.blue,
              ),
              Text(
                'CALL',
                style: textStyleInUtil,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Icon(
                Icons.drive_eta,
                size: 35,
                color: Colors.blue,
              ),
              Text(
                'ROUTE',
                style: textStyleInUtil,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Icon(
                Icons.share,
                size: 35,
                color: Colors.blue,
              ),
              Text(
                'SHARE',
                style: textStyleInUtil,
              )
            ],
          ),
        )
      ],
    ),
  );



  Widget content = Container(
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    padding: const EdgeInsets.all(10),  
    child: Text(
      dummyText
    ),
  );


}

  