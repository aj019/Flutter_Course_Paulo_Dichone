import 'package:flutter/material.dart';

class EaseAnimationWidget extends StatefulWidget{
  @override
  EaseAnimationWidgetState createState() {
    return new EaseAnimationWidgetState();
  }
}

class EaseAnimationWidgetState extends State<EaseAnimationWidget> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;


  void statusHandler(status){
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(statusHandler);
      _controller.reset();
      _animation = new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ))..addStatusListener((status){
        if (status == AnimationStatus.completed) {
//          Navigator.pop(context);
        }
      });
      _controller.forward();
    }
  }


  @override
  void initState() {
    super.initState();
    
    _controller = new AnimationController(vsync: this,duration: new Duration(seconds: 2));

    _animation = new Tween(begin: -1.0 , end: 0.0 ).animate(
        new CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn
        )
    );

    _animation.addStatusListener(statusHandler);
    
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return new AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context,Widget child){
        return new Scaffold(
            body: new Transform(
              transform: new Matrix4.translationValues(_animation.value * width,0.0,0.0),
              child: new Center(
                child: new Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.black12,
                ),
              ),
            ),
        );
      },

    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}