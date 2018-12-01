import 'package:flutter/material.dart';

class TransformationWidget extends StatefulWidget{
  @override
  TransformationWidgetState createState() {
    return new TransformationWidgetState();
  }
}

class TransformationWidgetState extends State<TransformationWidget> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation,_borderRadius;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = new AnimationController(vsync: this,duration: new Duration(seconds: 3));

    _animation = new Tween(begin: 10.0,end: 200.0).animate(new CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    _borderRadius = new BorderRadiusTween(begin: new BorderRadius.circular(75.0),end: new BorderRadius.circular(0.0)).animate(new CurvedAnimation(parent: _controller, curve: Curves.ease) );

   void statusHandler(status){

     if(status == AnimationStatus.completed){
       _controller.reverse();
     }

     if(status == AnimationStatus.dismissed){
       _controller.forward();
     }

   }

   _animation.addStatusListener(statusHandler);

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _controller.forward();
    return new AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context,Widget child){
          return new Scaffold(
            body: new Center(
              child: new Container(
                width: _animation.value,
                height: _animation.value,
                decoration: new BoxDecoration(
                  color: Colors.black12,
                  borderRadius: _borderRadius.value
                ),
              )
            ),
          );
        }
    );
  }
}