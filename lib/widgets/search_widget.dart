import 'package:app_book/contains/app_colors.dart';
import 'package:app_book/contains/font_text.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key,}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late bool changeColor = true;
  void _changeColorAll() {
    setState(() {
      changeColor = !changeColor;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: GestureDetector(
                  onTap: (){
                    _changeColorAll();
                  },
                  child: Icon(
                    Icons.search,
                    color: ColorWhite,
                    size: 26,
                  ),
                ),
                hintText: 'Search book here...',
                hintStyle: SearchHintStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.black,
              ),
              style: SearchTextStyle,
            ),
          ),
          GestureDetector(
            onTap: _changeColorAll,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    changeColor ? Icons.wb_sunny : Icons.night_shelter,
                    color: ColorWhite,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  
}
