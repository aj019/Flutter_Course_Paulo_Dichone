import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(){
  runApp(
    new MaterialApp(
      home: new EnterCityName(),
    )
  );
}

class EnterCityName extends StatelessWidget{

  TextEditingController textController = new TextEditingController();

  void passCountry(BuildContext context){
    var country = textController.text;
    if(country.isNotEmpty){
      Navigator.push(context,
          new MaterialPageRoute(
              builder: (context) => new KlimaticApp('$country')
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Klimatic'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              color: Colors.grey,
              onPressed: ()=> debugPrint('Clicked'))
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: textController,
            ),
            new RaisedButton(onPressed: (){
              passCountry(context);
            }, child: new Text('Submit'))
          ],
        ),
      ),
    );
  }

}




class KlimaticApp extends StatefulWidget {

  final String country;


  KlimaticApp(this.country);

  @override
  KlimaticAppState createState() {
    return new KlimaticAppState();
  }
}

class KlimaticAppState extends State<KlimaticApp> {

  var name;
  var _tempInCels= '';
  bool isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }

  void _getJsonData() async{

    var _data = await getWeatherData('${widget.country}');

    if(!isDisposed){
      setState((){
        _tempInCels = '${_data['main']['temp']} C';
      });
    }


  }


  @override
  Widget build(BuildContext context) {
    _getJsonData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Klimatic'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            color: Colors.grey,
            onPressed: ()=> debugPrint('Clicked'))
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/umbrella.png',width:520.0,height: 1200.0,fit: BoxFit.cover,),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
            child: updateTempWidget('${widget.country}')
          ),
          new Container(
            alignment: Alignment.center,
            child: new Center(
              child: new Image.asset('images/light_rain.png'),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: new Center(
              child: new Text('$_tempInCels',style: tempStyle(),),
            ),
          )

        ],
      )
    );
  }
}

TextStyle cityTextStyle(){
  return new TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 30.0,

  );
}

Future<Map> getWeatherData(String country) async{

  var url = 'http://api.openweathermap.org/data/2.5/weather?q=$country&APPID=1408c3246b2f6994aeaed9ccaa9a85dd&units=metric';

  http.Response response = await http.get(url);
  return json.decode(response.body);

}

Widget updateTempWidget(String country){
  return new FutureBuilder(
      future: getWeatherData(country),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
            return new Text(country,style: cityTextStyle(),);
        }else{
          return new Text('');
        }

  });
}