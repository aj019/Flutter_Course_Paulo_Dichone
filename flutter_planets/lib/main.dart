import 'package:flutter/material.dart';
import 'home_page_body.dart';

void main() => runApp(new MaterialApp(
      title: "Planets",
      home: new MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new HomePage();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor:const Color(0xFF736CB5),
      body: new Column(
        children: <Widget>[
          new GradientAppBar("treva"),
          new Container(
              child: new HomePageBody()),
        ],
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String text;
  final double barHeight = 66.0;

  GradientAppBar(this.text);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF3366FF),
                const Color(0xFF00CCFF),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)
      ),
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: barHeight + statusBarHeight,
      child: new Center(
        child: new Text(
          text,
          style: new TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 36.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}


