import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new QuakeApp(),
    );
  }

}

class QuakeApp extends StatefulWidget{
  @override
  QuakeAppState createState() {
    return new QuakeAppState();
  }

}

class QuakeAppState extends State<QuakeApp> {
  var _data;
  var _features;
  DateTime date;
  var format;
  var dateString;
  void getEarthQuakeData() async{
          _data = await getJson();

//          DateTime date = new DateTime.fromMillisecondsSinceEpoch(_data['features'][0]['properties']['time']);
//          var format = new DateFormat("yMd");
//          var dateString = format.format(date);
//          debugPrint(dateString);
          setState((){
              _features = _data['features'];
          });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getEarthQuakeData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quake App'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: new Container(
        child: new ListView.builder(

            itemCount: _features==null?0:_features.length,
            itemBuilder: (context,i){
              debugPrint('${_data['features'][i]['properties']['time']}');
              date = new DateTime.fromMillisecondsSinceEpoch(int.parse('${_data['features'][i]['properties']['time']}'));
               format = new DateFormat.yMMMMd("en_US").add_Hm() ;
               dateString = format.format(date);
             return new Column(
               children: <Widget>[
                 new Padding(padding: const EdgeInsets.all(10.0),
                 child: i%2!=0?new Divider(): new ListTile(
                   title: new Text(dateString,style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.orange,fontSize: 20.0)),
                   leading: new CircleAvatar(
                     backgroundColor: Colors.green,
                     child: new Text('${_features[i]['properties']['mag']}',style: new TextStyle(fontSize: 16.0,),),
                   ),
                   subtitle: new Text('${_features[i]['properties']['place']}',style: new TextStyle(fontStyle: FontStyle.italic),),
                 ),
                 )

               ],
             );

        }),

      ),
    );
  }
}

Future<Map> getJson() async{
  var url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

