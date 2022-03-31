import 'package:app_book/contains/app_colors.dart';
import 'package:app_book/model/book.dart';
import 'package:app_book/model/book_api_item.dart';
import 'package:app_book/screen/library.dart';
import 'package:app_book/service/call_api_book_item.dart';
import 'package:flutter/material.dart';

class ReadBook extends StatefulWidget {
  String id;
  ReadBook({
    Key? key,
    required this.id
  }) : super(key: key);

  @override
  State<ReadBook> createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> {
  CallBookItem client = CallBookItem();
  BookItem? bookItem;
  Future<void> getData() async{
    bookItem = await client.getBookRecommended(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    // var _data = ModalRoute.of(context)!.settings.arguments as Books;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorGrey1,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
              color: ColorBlack,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleBookWidget(
                      '${bookItem!.title}',
                      '${bookItem!.price}',
                      '${bookItem!.authors}',
                      '${bookItem!.publisher}',
                      '${bookItem!.image}'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Row(
                          children: const [
                            Icon(Icons.menu_book),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Read'),
                          ],
                        ),

                        // here push data
                        onPressed: () {
                          // Navigator.pushNamed(context, '/library', arguments: widget.book);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => TestWidget()));
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => LibraryWidget(), settings: RouteSettings(
                          //   arguments: widget.book
                          // )));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        child: Row(
                          children: const [
                            Icon(Icons.add),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Add Library'),
                          ],
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)),
                                  backgroundColor: ColorGrey1,
                                  child: SizedBox(
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.blue,
                                            size: 50,
                                          ),
                                        ),
                                        const Text(
                                          "Add library Success",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(15))),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Close",
                                                style: TextStyle(color: Colors.white),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IntroduceWidget('${bookItem!.desc}'),
                ],
              ),
            );
          } else if(snapshot.connectionState == ConnectionState.none){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      )
    );
  }
}

Widget TitleBookWidget(
    String name, String score, String author, String type, String imgUrl) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imgUrl,
                      height: 250,
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Price: $score',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ])),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Author: $author',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Type: $type',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorGrey1,
                            ),
                            child: const Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorGrey1,
                            ),
                            child: const Icon(
                              Icons.thumb_down_alt_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorGrey1,
                            ),
                            child: const Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

//push data to library widget
Widget ButtonWidget(BuildContext context, Book book) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      ElevatedButton(
        child: Row(
          children: const [
            Icon(Icons.menu_book),
            SizedBox(
              width: 5,
            ),
            Text('Read'),
          ],
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      const SizedBox(
        width: 25,
      ),
      ElevatedButton(
        child: Row(
          children: const [
            Icon(Icons.add),
            SizedBox(
              width: 5,
            ),
            Text('Add Library'),
          ],
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LibraryWidget(), settings: RouteSettings(
            arguments: book,
          )));
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

Widget IntroduceWidget(String desc) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Introduce',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          desc,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ],
    ),
  );
}
