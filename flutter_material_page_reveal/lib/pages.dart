import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(Colors.blue, 'images/hotels.png', 'Hotels', 'This is body',
      'images/key.png'),
  new PageViewModel(Colors.greenAccent, 'images/banks.png', 'Banks',
      'This is body', 'images/wallet.png'),
  new PageViewModel(Colors.purple.shade100, 'images/stores.png', 'Store',
      'All local stores are caterized', 'images/shopping_cart.png')
];

class Page extends StatelessWidget {
  final PageViewModel pageViewModel;
  final double percentVisible;

  Page({this.pageViewModel, this.percentVisible = 1.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: double.infinity,
      color: pageViewModel.color,
      child: new Opacity(
        opacity: percentVisible,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Transform(
              transform: new Matrix4.translationValues(0.0,50.0  * (1.0 - percentVisible) ,0.0),
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: new Image.asset(
                  pageViewModel.heroAssetPath,
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            new Transform(
              transform : new Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  pageViewModel.title,
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
            ),
            new Transform(
                transform : new Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: new Text(
                  pageViewModel.body,
                  style: new TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcon;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body,
      this.iconAssetIcon);
}
