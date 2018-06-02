import 'package:flutter/material.dart';


class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
        color: Colors.blue,
        child: new Center(
          child: new Text('hello world',
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 20.0)),
        )


    );
  }

}