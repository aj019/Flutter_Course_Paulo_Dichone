import 'package:flutter/material.dart';

class PagerIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return           new Column(
      children: <Widget>[
        new Expanded(child: new Container(),),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 20.0,
                height: 20.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x88ffffff),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 50.0,
                height: 50.0,

                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x88ffffff),
                ),
                child: new Image.asset('images/wallet.png'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 20.0,
                height: 20.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(
                        color: const Color(0x88ffffff),
                        width: 3.0
                    )
                ),

              ),
            )
          ],
        )
      ],
    );

  }

}

//class PagerBubbleViewModel {
//  final String heroAssetPath;
//  final Color color;
//
//}