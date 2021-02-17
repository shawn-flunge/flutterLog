import 'package:flutter/material.dart';

import 'parentHero.dart';

class ChildHero extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // return Center(
    //   child: Container(
    //     width: MediaQuery.of(context).size.width,
    //     child: Hero(
    //       tag: 'cambodia',
    //       child: Material(
    //         child: InkWell(
    //           child: Image(
    //             image: AssetImage('assets/cambodia.jpeg'),
    //             fit: BoxFit.fitWidth,
    //           ),
    //           onTap: () => Navigator.of(context).pop(),
    //         ),
    //       ),
    //     ),
    //   ),
    // );


    return Scaffold(
      appBar: AppBar(title: Text('child')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: 'cambodia1',
          child: Material(
            child: InkWell(
              child: Image(
                image: AssetImage('assets/cambodia.jpeg'),
                fit: BoxFit.fitWidth,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
    );
  }
}
