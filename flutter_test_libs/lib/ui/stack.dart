import 'package:flutter/material.dart';

class Stack_Example extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        color: Colors.greenAccent,
        alignment: Alignment.center,
        child: new Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              const Text('Hello'),
              const Text('World'),

            ],
        ),
    );
  }

}