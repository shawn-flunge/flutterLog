import 'package:flutter/material.dart';

import '../../store.dart';

const TextStyle textStyleInUtil = TextStyle(color: Colors.blue, fontSize: 15.0);

class InteractiveTutorial extends StatefulWidget {
  final WantToGo gogo;
  InteractiveTutorial({this.gogo});

  InteractiveTutorialState createState() => InteractiveTutorialState();
}

class InteractiveTutorialState extends State<InteractiveTutorial> with TickerProviderStateMixin{


  Size defaultSize = const Size(30,30);
  Size clicked = const Size(50,50);

  Animation<Size> size;
  AnimationController controller;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );

    size = SizeTween(
      begin: defaultSize,
      end: clicked
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval( 0.0, 1.000,
          curve: Curves.easeInOutBack
        ),   
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.gogo.title),
              background: InkWell(
                child: Hero(
                  child: Image(image: widget.gogo.image.image,fit:BoxFit.fitHeight),
                  tag: widget.gogo.title,
                ),
                onTap:()=>showMainImage(context, widget.gogo.image)
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: ListView(
                children: <Widget>[
                  //buildMainImage(widget.gogo),
                  Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                  buildTitle(widget.gogo),
                  buildUtil(),
                  buildContent(widget.gogo)
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget buildMainImage(WantToGo gogo) {
    return Container(
      child: Hero(
        child: gogo.image,
        tag: gogo.title,
      ),
    );
  }

  Widget buildTitle(WantToGo gogo) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 30, 30, 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      gogo.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    )),
                Text(
                  gogo.subTitle,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          gogo.isLiked ?
          InkWell(
            child:AnimatedBuilder(
              animation: controller, 
              builder: (context,child){
                return Icon(Icons.star,size: size.value.width,color: Colors.red,);
              }
            ),
            onTap: () async{
              // controller.forward().then((value) => controller.reverse());
              await controller.forward();
              await controller.reverse();
              setState(() {
                gogo.isLiked = false;
                gogo.like --;
              });
            },
          ):
          InkWell(
            child:Icon(
                Icons.star_border_outlined,
                color: Colors.red,
                size: 30,
              ),
            onTap: (){
              
              setState(() {
                gogo.isLiked = true;
                gogo.like ++;
              });
              controller.forward().then((value) => controller.reverse());
            },
          ),    
          Text(gogo.like.toString(),
            style: TextStyle(
              fontSize: 15.0
            ),
          )
        ],
      ),
    );
  }

  Widget buildUtil() {
    return Container(
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
  }

  Widget buildContent(WantToGo gogo) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
      padding: const EdgeInsets.all(10),
      child: Text(gogo.content),
    );
  }

  void showMainImage(BuildContext context,Image image){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: image,
        );
      }   
    );
  }



}
