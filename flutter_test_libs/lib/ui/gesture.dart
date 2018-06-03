import 'package:flutter/material.dart';

class Gesture_Example extends StatelessWidget{

  final String title;

  //Single Parameter
  Gesture_Example(this.title);
  //Multi Parameter
  // Gesture_Example({this.name,this.title});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),

      body: new Center(
          child:new CustomButton()
      ),
    );
  }


}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
        onTap: () {
          final snackbar = new SnackBar(content: new Text("Hello Gestures"),
            backgroundColor: Colors.blue.shade100,
            duration: new Duration(milliseconds: 1000),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        },
      
       // Actual Button
      child:  new Container(
        padding: const EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: new BorderRadius.circular(5.0)
        ),
        child: new Text("Button",style: new TextStyle(color: Colors.white),),
      ),
    );
  }
}