import 'package:app_book/contains/app_colors.dart';
import 'package:app_book/widgets/trending_book.dart';
import 'package:app_book/widgets/recommended/recommended_widget.dart';
import 'package:app_book/widgets/search_widget.dart';
import 'package:app_book/widgets/slider/slider_image.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorBlack,
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SearchWidget(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: SliderWidget(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: RecommendedWidget(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TrendingBook(),
                ),
              ],
            ),
          ),
        ),
      )
      // ),
    );
  }
}
