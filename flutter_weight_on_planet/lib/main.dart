import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new MainApp()
    );
  }
}

class MainApp extends StatefulWidget{
  @override
  MainAppState createState() {
    return new MainAppState();
  }

}

class MainAppState extends State<MainApp> {
  
  final TextEditingController _textController = new TextEditingController();
  int radioValue = 0;
  int weight;
  var planet = '';
  var output ='';
  void handleRadioValueChange(int value){
    setState((){
      radioValue = value;
      if(_textController.text.isNotEmpty) {
        switch (value) {
          case 0:
            planet = 'Pluto';
              weight = int.parse(_textController.text);
              weight += 20;

            break;
          case 1:
            planet = 'Mars';
              weight = int.parse(_textController.text);
              weight += 30;
            break;
          case 2:
            planet = 'Jupiter';
              weight = int.parse(_textController.text);
              weight += 40;
            break;
        }
        output = 'Your weight on $planet is $weight';
      }else{
        output = 'Please enter a correct weight';
      }

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black26,
        title: new Text('Weight on Planet X'),
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            new Image.asset('images/planet.png',width: 150.0,height: 150.0,),
            new Padding(padding: const EdgeInsets.all(20.0)),
            new TextField(
              controller: _textController,
              decoration: new InputDecoration(
                hintText: 'Your weight on Earth',
                icon: new Icon(Icons.person)
              ),
            ),
            new Row(
              children: <Widget>[
                new Radio<int>(
                    activeColor: Colors.orange,
                    value: 0, groupValue: radioValue, onChanged: handleRadioValueChange
                ),
                new Text('Pluto'),
                new Radio<int>(
                    activeColor: Colors.orange,
                    value: 1, groupValue: radioValue, onChanged: handleRadioValueChange
                ),
                new Text('Mars'),
                new Radio<int>(
                    activeColor: Colors.orange,
                    value: 2, groupValue: radioValue, onChanged: handleRadioValueChange
                ),
                new Text('Jupiter'),
              ],
            ),
            new Padding(padding: const EdgeInsets.all(20.0)),
            new Text(' $output ',style: new TextStyle(fontSize: 20.0),)

          ],
        )
      ),
    );
  }
}