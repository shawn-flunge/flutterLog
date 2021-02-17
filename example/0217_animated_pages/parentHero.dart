import 'package:flutter/material.dart';

import 'childHero.dart';

class ParentHero extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 300,
        height: 180,
        child: InkWell(
          child: Hero(
            tag: 'cambodia', 
            child: Image(image: AssetImage('assets/cambodia.jpeg'))
          ),
          onTap: () {
            Future.delayed(Duration(seconds: 3),(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ChildHero();
              }));
            });
          },
        ),
      ),
    );

  }


}
