import 'package:flutter/material.dart';

class ParentingWidget extends StatefulWidget{
  @override
  ParentingWidgetState createState() {
    return new ParentingWidgetState();
  }
}

class ParentingWidgetState extends State<ParentingWidget> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _translateAnimation,_growingAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = new AnimationController(vsync: this,duration: new Duration(seconds: 2));

    _translateAnimation = new Tween(begin: -1.0,end: 0.0).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn
    ));

    _growingAnimation = new Tween(begin: 10.0,end: 100.0).animate(new CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    void statusHandler(status){

      if(_translateAnimation.isCompleted){
        _controller.reverse();
      }

      if(_translateAnimation.isDismissed){

      }

    }

    _translateAnimation.addStatusListener(statusHandler);

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return new AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child){
          return new Scaffold(
            body: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Transform(
                    transform: new Matrix4.translationValues(_translateAnimation.value * width, 0.0, 0.0),
                    child: new Center(
                              child: new Container(
                                width: _growingAnimation.value * 2,
                                height: _growingAnimation.value ,
                                color: Colors.black12,
                              ),
                    ),
                )
              ],
            ),
          );
        }
    );
  }
}