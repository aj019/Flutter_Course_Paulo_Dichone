import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Make it Rain',
    home: new MainScreen(),
    
  ));
}

class MainScreen extends StatefulWidget{
  @override
  MainScreenState createState() {
    return new MainScreenState();
  }

}

class MainScreenState extends State<MainScreen> {

  var amount = 12000;
  void increase_amount(){
    setState((){
      amount += 500;
      if(amount > 10000){

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Make it Rain'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            new Text('Get Rich',style: new TextStyle(fontSize: 30.0),),
            new Container(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 50.0),
              child: new Text('\$$amount',style: new TextStyle(fontSize: 60.0,color: amount > 10000 ? Colors.green : Colors.greenAccent,fontWeight: FontWeight.bold)),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
              decoration: new BoxDecoration(
                color: Colors.green,
              ),
              child: new InkWell(
                child: new Text('Let It Rain',style: new TextStyle(color: Colors.white),),
                onTap: () {
                  increase_amount();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}