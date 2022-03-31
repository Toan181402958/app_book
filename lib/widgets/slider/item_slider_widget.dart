import 'package:app_book/contains/font_text.dart';
import 'package:flutter/material.dart';

Widget ItemSliderWidget (String image, String title, String content){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
        alignment: Alignment.center,
        child: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  image,
                ),
              ),
            ),
            height: 200.0,
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.centerRight,
                    end: FractionalOffset.centerLeft,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [
                      0.0,
                      1.0
                    ])),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    title,
                    style: TitleSliderStyle,
                  ),
                  Text(
                    content,
                    style: ContentSliderStyle,
                  ),
                ],
              ),
            ),
          )
        ]),
  );
}