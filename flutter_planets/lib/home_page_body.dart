import 'package:flutter/material.dart';
import 'planet_model.dart';

//class HomePageBody extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new Expanded(
//      child: new ListView.builder(
//          itemCount: planets.length,
//          itemBuilder: (context,i) => new PlanetRow(planets[i]),
//          padding: new EdgeInsets.symmetric(vertical: 16.0)
//      ),
//    );
//  }
//
//}

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: new SliverChildBuilderDelegate(
                      (context, index) => new PlanetRow(planets[index]),
                  childCount: planets.length,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanetCard extends StatelessWidget {

  final Planet planet;


  PlanetCard(this.planet);

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(
        fontFamily: 'Poppins'
    );


    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400
    );

    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600
    );

    final subHeaderTextStyle = regularTextStyle.copyWith(
        fontSize: 12.0
    );


    final planetContents = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          new Container(height: 4.0),
          new Text(planet.name,
            style: headerTextStyle,
          ),
          new Container(height
              : 10.0),
          new Text(planet.location,
              style: subHeaderTextStyle
          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)
          ),
          new Row
            (
            children: <Widget>[
              new Expanded(
                child: new Row(
                  children: <Widget>[
                    new Image.
                    asset("images/ic_distance.png", height: 12.0)
                    ,
                    new Container(width: 8.0),
                    new
                    Text(planet.distance,
                      style: regularTextStyle,
                    ),
                  ],
                ),
              ),
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(width: 24.0),
                    new Image.asset("images/ic_gravity.png", height
                        : 12.0),
                    new Container(width: 8.0
                    ),
                    new Text(planet.gravity,
                      style: regularTextStyle,
                    ),
                  ],
                ),
              )

            ],
          ),
        ]
        ,
      ),
    );


    return new Container(
      height
          : 124.0,
      margin: new EdgeInsets.only(
          left: 46.0),
      decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape:
          BoxShape.rectangle,
          borderRadius: new BorderRadius.circular
            (8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius
                  : 10.0,
              offset: new Offset(0.0,
                  10.0),
            )
          ]
      ),
      child:planetContents,
    );
  }

}


class PlanetImage extends StatelessWidget {

  final String imagePath;


  PlanetImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Image(image: new AssetImage(imagePath)),
    );
  }

}

class PlanetRow extends StatelessWidget {

  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: new Stack(
        children: <Widget>[
          new PlanetCard(planet),
          new PlanetImage(planet.image)
        ],
      ),

    );
  }

}