
import 'package:app_book/widgets/slider/item_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final ListImageBooks = [
    'images/upcoming1.jpg',
    'images/upcoming2.png',
    'images/upcoming3.jpg',
  ];
  String titleBook = 'Book Store';
  String contentBook = 'Book app UI with dark mode enabled, \n'
      ' also this app created using the Flutter 2.5 skeleton template.';

  var _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 130,
      child: Stack(
        children: [
          PageView(
            controller: _pageViewController,
            children: ListImageBooks.map(
                (e) => ItemSliderWidget(e, titleBook, contentBook)).toList(),
          ),
          Positioned(
              left: 30,
              bottom: 10,
              child: SmoothPageIndicator(
                controller: _pageViewController,
                count: ListImageBooks.length,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.white
                ),
                onDotClicked: (index) {
                  _pageViewController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
              ))
        ],
      ),
    );
  }
}
