import 'package:app_book/contains/app_colors.dart';
import 'package:app_book/contains/font_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget ItemListCommen(
    double position, String image, String name, String author) {
  final ListRecommendeds = [
    'images/book1.jpg',
    'images/book2.jpg',
    'images/book3.jpg',
    'images/book4.jpg',
    'images/book5.jpg',
    'images/book6.jpg',
    'images/book7.jpg',
    'images/book8.jpg',
    'images/book9.jpg',
    'images/book10.jpg',
  ];
  return Container(
    child:
    ListView.separated(
        itemBuilder: (_, int index){
          return Container(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('images/book1.jpg'),
                ),
                Positioned(
                  top: 10,
                    left: 10,
                    child: _IconStar(Icons.star, '4.9')
                )
              ],
            ),
          );
        },
        separatorBuilder: (_, index) => const SizedBox(
          width: 15,
        ),
        itemCount: ListRecommendeds.length
    ),
  );
}
Widget _IconStar (IconData icon, String text){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      children: [
        Icon(icon, size: 12,),
        Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),)
      ],
    ),
  );
}

