import 'package:flutter/material.dart';

// Scaffold provides a structure to our material design application
/* It has useful apis like
    - AppBar
    - Navigation Menu
    - Bottom Navigation Bar
    - Snackbar
    - Floating Action Button
 */

//Also learned about Inkwell - used for adding touch listeners


class Scaffold_Example extends StatelessWidget{


  void _onPress(){
    debugPrint('Send Clicked');
  }

  void _onSearchPress(){
    debugPrint('Search Clicked');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text('Home'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () => debugPrint('Button Clicked')
          ),
          new IconButton(
              icon: new Icon(Icons.send),
              onPressed: _onPress
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: _onSearchPress
          ),
        ],
      ),

      // Other Properties of Scaffold
      backgroundColor: Colors.grey.shade100,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Bonni",style: new TextStyle(fontSize: 14.5,fontWeight: FontWeight.w400,color: Colors.deepOrange)),
            new InkWell(
              child: new Text("Button"),
              onTap: () => debugPrint('Button Tapped'),
            )
          ],
        ),

      ),



    );


  }

}