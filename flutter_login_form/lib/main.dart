import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login',
      home: new LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return new LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  var username = '';
  void _clear(){
    setState((){
      _usernameController.clear();
      _passwordController.clear();
    });

  }

  void _login(){
    setState((){
      if(_usernameController.text.isNotEmpty)
        username = 'Welocme '+_usernameController.text;

    });

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.greenAccent,
            ),
            new Container(
              height: 200.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                      controller: _usernameController,
                      decoration: new InputDecoration(
                          hintText: 'Enter Username',
                          icon: new Icon(Icons.person))),
                  new TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: new InputDecoration(
                          hintText: 'Enter password',
                          icon: new Icon(Icons.lock))),
                  new Padding(padding: const EdgeInsets.all(10.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: new RaisedButton(
                              color: Colors.red,
                              onPressed: () {
                                _login();
                              },
                              child: new Text('Login',style: new TextStyle(color: Colors.white),)
                          )
                      ),
                      new Container(
                          margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: new RaisedButton(

                              color: Colors.red,
                              onPressed: () {
                                _clear();
                              },
                              child: new Text('Clear',style: new TextStyle(color: Colors.white),)
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(20.0)),
            new Text('$username',style: new TextStyle(color: Colors.white,fontSize: 20.0),)
            
          ],
        ),
      ),
    );
  }
}
