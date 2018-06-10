import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class AsyncExample extends StatefulWidget{


  @override
  AsyncExampleState createState() {
    return new AsyncExampleState();
  }

}

class AsyncExampleState extends State<AsyncExample>  {

  var body_text = '';

  List _data;
  void _getApi() async{
    _data = await getJSON();
    print(_data[0]['userId']);
    body_text = _data[0]['title'];
  }

  void _showonTapMessage(BuildContext context, String message) {
    var alert = new AlertDialog(
      title: new Text('App'),
      content: new Text(message),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('OK'))
      ],
    );
    //showDialog(context: context, child: alert);
    showDialog(context: context, child: alert);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _getApi();



    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Async Example'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new ListView.builder(
            itemCount: _data.length==null?0:_data.length,
            itemBuilder: (context,int position){
              return new Column(
                children: <Widget>[
                  new Divider(height: 5.5),
                  new ListTile(
                    title: new Text(
                      "${_data[position]['title']}",
                      style: new TextStyle(fontSize: 17.9),
                    ),
                    subtitle: new Text("${_data[position]['body']}",
                        style: new TextStyle(
                            fontSize: 13.9,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic)),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: new Text(
                        "${_data[position]['body'][0]}".toUpperCase(),
                        style: new TextStyle(
                            fontSize: 16.4, color: Colors.orangeAccent),
                      ),
                    ),
                    onTap:() => _showonTapMessage(context, _data[position]['body']),

                  )
                ],
              );
        }),
      )
    );
  }
}


Future<List> getJSON() async{
  String apiURL = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(apiURL);
  return json.decode(response.body);
}