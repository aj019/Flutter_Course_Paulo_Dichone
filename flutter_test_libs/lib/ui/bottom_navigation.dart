import 'package:flutter/material.dart';

class BottomNavigation_Example extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.greenAccent,
        ),
        
        floatingActionButton: new FloatingActionButton(
            onPressed: ()=> debugPrint("Tapped"),
            backgroundColor: Colors.blue,
            tooltip: 'Going Up',
            child: new Icon(Icons.add),

        ),

        bottomNavigationBar: new BottomNavigationBar(items: [
          new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
          new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
          new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
        ],
        onTap: (i) => debugPrint("Touched $i"),
        ),

    );

  }

}