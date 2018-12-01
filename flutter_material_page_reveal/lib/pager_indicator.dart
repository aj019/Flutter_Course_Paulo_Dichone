import 'dart:ui';

import 'package:flutter/material.dart';
import 'pages.dart';

class PagerIndicator extends StatelessWidget{

  final PageIndicatorViewModel pageIndicatorViewModel;


  PagerIndicator({this.pageIndicatorViewModel});

  @override
  Widget build(BuildContext context) {

    List<PageBubble> bubbles = [];

    for(var i=0;i<pageIndicatorViewModel.pages.length;i++){
      final page = pageIndicatorViewModel.pages[i];
      debugPrint(" Hello $i");
      bubbles.add(new PageBubble(
        viewModel: new PagerBubbleViewModel(
            page.iconAssetIcon,
            page.color,
            i > pageIndicatorViewModel.activeIndex,
            i == pageIndicatorViewModel.activeIndex ? 1.0 : 0.0),
      ));
    }

    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Expanded(child: new Container(),),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bubbles,
        )
//        new Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new PageBubble(
//              viewModel: new PagerBubbleViewModel('images/shopping_cart.png', const Color(0x88ffffff), true, 0.1),
//            ),
//            new PageBubble(
//              viewModel: new PagerBubbleViewModel('images/shopping_cart.png', const Color(0x88ffffff), false, 1.0),
//            ),
//            new PageBubble(
//              viewModel: new PagerBubbleViewModel('images/shopping_cart.png', const Color(0x88ffffff), true, 0.1),
//            ),
//          ],
//        )
      ],
    );

  }

}

class PageBubble extends StatelessWidget{

  final PagerBubbleViewModel viewModel;


  PageBubble({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: lerpDouble(20.0,45.0,viewModel.activePercent),
        height: lerpDouble(20.0,45.0,viewModel.activePercent),

        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: viewModel.isHollow ? Colors.transparent : const Color(0x88ffffff),
          border: new Border.all(
            color: viewModel.isHollow ? const Color(0x88ffffff) : Colors.transparent,
            width: viewModel.isHollow ? 3.0 : 0.0,
          )
        ),
        child: new Opacity(
            opacity: 1.0,
            child: new Image.asset(viewModel.heroAssetPath,color: Colors.white,)),
      ),
    );
  }

}

enum SlideDirection{
  leftToRight,
  rightToLeft,
  none
}

class PageIndicatorViewModel{
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PageIndicatorViewModel(this.pages, this.activeIndex, this.slideDirection,
      this.slidePercent);


}

class PagerBubbleViewModel {
  final String heroAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PagerBubbleViewModel(
      this.heroAssetPath, this.color, this.isHollow,
      this.activePercent);


}
