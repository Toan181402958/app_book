import 'package:app_book/contains/app_colors.dart';
import 'package:app_book/model/book.dart';
import 'package:flutter/material.dart';

class LibraryWidget extends StatefulWidget {
  // Book book;
  const LibraryWidget({Key? key}) : super(key: key);

  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {
  var ListLibrary = Book.generateRecommendedBook();
  List<Book> Library1 = [];
  @override
  Widget build(BuildContext context) {
    //data from readbookwidget
    var _data = ModalRoute.of(context)!.settings.arguments as Book;
    // Library1.add(_data);
    return Container(
      color: ColorBlack,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(ListLibrary.length, (index) {
          return Center(child: SelectCard(book: ListLibrary[index]));
        }),
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: ColorGrey1,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      '${book.imgUrl}',
                      height: 150,
                    )),
                Text(
                  '${book.name}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                )
              ]),
        ));
  }
}
