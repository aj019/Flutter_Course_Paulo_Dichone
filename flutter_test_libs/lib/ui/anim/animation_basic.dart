import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class AnimationExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new AnimationAdvanced(),
    );
  }
}

class Animation_Basic extends StatefulWidget {
  @override
  Animation_BasicState createState() {
    return new Animation_BasicState();
  }
}

class Animation_BasicState extends State<Animation_Basic> with SingleTickerProviderStateMixin {

  AnimationController animation;


  @override
  void initState() {

    animation = new AnimationController(vsync: this,
        duration: new Duration(seconds: 10));
    animation.addListener((){
      this.setState((){

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Center(
       child: new Text(
          animation.isAnimating ? "${animation.value.toStringAsFixed(3)}":"Tap Me",
         style: new TextStyle(fontSize: 50.0),
        )
      ),
      onTap: (){
        animation.forward(from: 0.0);
      },
    );
  }
}

class AnimationAdvanced extends StatefulWidget{

  @override
  AnimationAdvancedState createState() {
    return new AnimationAdvancedState();
  }

}

class AnimationAdvancedState extends State<AnimationAdvanced> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation animation;
  Tween tween;

  static const FACE_LEFT_ANGLE = -sqrt1_2/2;
  static const FACE_RIGHT_ANGLE = sqrt1_2/2;

  double _angle = FACE_RIGHT_ANGLE;

  @override
  void initState() {
    // TODO: implement initState
    _controller = new AnimationController(
        vsync: this,
        duration: new Duration(seconds: 2),

    );
    _controller.addListener((){
      this.setState((){

      });


    });

    tween = new AlignmentTween(
        begin: new Alignment(-1.0, 0.0),
        end: new Alignment(1.0, 0.0)
    );


    _controller.addStatusListener((status){
        if(status == AnimationStatus.completed){
          _controller.reverse();
          _angle = FACE_LEFT_ANGLE;
        }else if(status == AnimationStatus.dismissed){
          _controller.forward();
          _angle = FACE_RIGHT_ANGLE;
        }
    });

    animation = tween.animate(_controller);
    _controller.forward();

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){

      },
      child: new Stack(

        fit: StackFit.expand,
        children: <Widget>[
          new FractionallySizedBox(
            heightFactor: 2.0,
            widthFactor: 0.2,
            alignment: animation.value,
            child: new Transform.rotate(angle:_angle,
                child: new Icon(Icons.flight,size: 80.0,)),
          )
        ],
      ),
    );
  }
}
