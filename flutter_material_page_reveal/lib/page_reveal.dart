import 'dart:math';

import 'package:flutter/material.dart';

class PageReveal extends StatelessWidget{

  final double percentReveal;
  final Widget child;


  PageReveal({this.percentReveal, this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ClipOval(
      clipper:  new CircleCustomClipper(percentReveal),
      child: child,
    );
  }

}

class CircleCustomClipper extends CustomClipper<Rect>  {

  final double percentReveal;


  CircleCustomClipper(this.percentReveal);

  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width/2, size.height * 0.9);

    double theta = atan(epicenter.dy/epicenter.dx);
    final distanceToCenter = epicenter.dy/sin(theta);

    final radius = distanceToCenter * percentReveal;
    final d = radius * 2;
    
    return new Rect.fromLTWH(epicenter.dx - radius, epicenter.dy - radius, d, d);

  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

