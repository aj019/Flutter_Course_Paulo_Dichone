import 'package:flutter/material.dart';
import 'package:flutter_material_page_reveal/pages.dart';
import 'page_reveal.dart';
import 'pager_indicator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new MaterialPageReveal(),
    );
  }

}

class MaterialPageReveal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Page(pageViewModel: pages[0],percentVisible: 0.9,),
          new PageReveal(
              percentReveal: 0.0,
              child: new Page(
                pageViewModel: pages[1],
                percentVisible: 0.9,)
          ),
          new PagerIndicator(
            pageIndicatorViewModel: new PageIndicatorViewModel(pages, 1, SlideDirection.none, 0.0),
          ),
        ],
      ),
    );
  }

}