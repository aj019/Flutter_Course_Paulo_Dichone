import 'package:flutter/material.dart';

//Contains example of Using Container, Coloumn,Row and expanded

class Container_Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.greenAccent,
      alignment: Alignment.center,

      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        new Text(
            'Hello',
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
          ),
          new Expanded(
              child: new Text(
                'Hello',
                textDirection: TextDirection.ltr,
                style: new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
          ),

          new Container(
            color: Colors.blue,
            child: new Text('hello 3'),
          ),
        ],
      ),

//      child: new Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new Text(
//            'Hello',
//            textDirection: TextDirection.ltr,
//            style: new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
//          ),
//          new Text(
//            'Hello',
//            textDirection: TextDirection.ltr,
//            style: new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
//          ),
//          new Container(
//            color: Colors.blue,
//            child: new Text('hello 3'),
//          ),
//
//        ],
//      ),

//        child: new Text('Hello',
//          textDirection: TextDirection.ltr,
//          style: new TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic),),
    );
  }
}
