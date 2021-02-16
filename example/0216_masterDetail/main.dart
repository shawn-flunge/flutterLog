

import 'package:flutter/material.dart';

import 'detailPage.dart';
import 'detailWidget.dart';

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
      home: MasterDetail(title: '0216 master detail'),
    );
  }
}


class MasterDetail extends StatefulWidget{
  final String title;
  MasterDetail({this.title});

  MasterDetailState createState() => MasterDetailState();
}

class MasterDetailState extends State<MasterDetail>{
  
  int selectedIndex =0;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    print('build : ' +MediaQuery.of(context).orientation.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context,index){
                  return Divider(color:Colors.black);
                },
                itemCount: 20,
                itemBuilder: (context, index){
                  return Builder(
                    builder: (context){
                      return Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(index.toString()),
                              onTap: (){
                                
                                setState(() {
                                  selectedIndex = index;
                                  isTapped = true;
                                });
                                if(MediaQuery.of(context).orientation == Orientation.portrait)
                                  Navigator.push(context, MaterialPageRoute(builder: (context){ return DetailPage(selectedIndex: selectedIndex,);}));
                              },
                            ),
                          ),      
                        ],
                      ); 
                    },
                  );
                },  
              ),
            ),
            (MediaQuery.of(context).orientation==Orientation.landscape && isTapped == true) ? Expanded(child: DetailWidget(selectedIndex: selectedIndex,)) : Container()
          ],
        ),
      ),
    );
  }

}