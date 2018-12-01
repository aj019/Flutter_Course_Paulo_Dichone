import 'package:flutter/material.dart';
import 'package:fluttery/layout.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Tinder',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  Widget _buildAppBar() {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      leading: new IconButton(
            icon: new Icon(
          Icons.person,
          color: Colors.grey,
          size: 40.0,
        ),
        onPressed: (){

        },
      ),
      title: new FlutterLogo(
        size: 30.0,
        colors: Colors.red,
      ),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.chat_bubble,
            color: Colors.grey,
            size: 40.0,
          ),
          onPressed: (){

          },
        ),
      ],
    );
  }

  Widget _buildBottomBar(){
    return new BottomAppBar(
      elevation: 0.0,
      child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RoundIconButton.small(
                icon: Icons.refresh,
                iconColor: Colors.blue,
                onPresssed: (){

                },
              ),
              new RoundIconButton.large(
                icon: Icons.clear,
                iconColor: Colors.red,
                onPresssed: (){

                },
              ),
              new RoundIconButton.small(
                icon: Icons.star,
                iconColor: Colors.blue,
                onPresssed: (){

                },
              ),
              new RoundIconButton.large(
                icon: Icons.favorite,
                iconColor: Colors.green,
                onPresssed: (){

                },
              ),
              new RoundIconButton.small(
                icon: Icons.lock,
                iconColor: Colors.purple,
                onPresssed: (){

                },
              )

            ],
          ),
      ),
    );
  }

  Widget _buildCardStack(){
    return new AnchoredOverlay(
      showOverlay: true,
      child: new Center(),
      overlayBuilder: (BuildContext context,Rect anchorBounds,Offset anchor ){

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomBar(),
      body: new Image.asset('images/photo_1.jpg'),
    );
  }
}

class RoundIconButton extends StatelessWidget{

  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPresssed;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
    this.onPresssed,
  }) : size = 60.0;


  RoundIconButton.small({
    this.icon,
    this.iconColor,
    this.onPresssed,
  }) : size = 50.0;


  RoundIconButton({this.icon, this.iconColor, this.size, this.onPresssed});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: new Color(0x11000000),
            blurRadius: 10.0,
          ),
        ]
      ),
      child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 0.0,
          child: new Icon(icon,color: iconColor,),
          onPressed: onPresssed),
    );


  }

}
