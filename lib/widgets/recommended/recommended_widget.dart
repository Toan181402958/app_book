import 'package:app_book/contains/font_text.dart';
import 'package:app_book/model/book.dart';
import 'package:app_book/model/book_api_recommended.dart';
import 'package:app_book/screen/read_book.dart';
import 'package:app_book/service/call_api_book_recommended.dart';
import 'package:flutter/material.dart';


class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({Key? key}) : super(key: key);

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  final recommendedLists = Book.generateRecommendedBook();
  BookRecommendedClient client = BookRecommendedClient();
  BookRecommended? data;

  Future<void> getData() async {
    data = await client.getBookRecommended();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended for you',
                style: CommemdedStyle,
              ),
              Text(
                'See more',
                style: SeeMoreStyle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.books!.length,
                      itemBuilder: (_, index) {
                        // var book = recommendedLists[index];
                        var bookRecommended = data!.books![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReadBook(id: bookRecommended.isbn13.toString())
                                ));
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      '${bookRecommended.image}',
                                      fit: BoxFit.cover,
                                      height: 180,
                                      width: 130,
                                    ),
                                  ),
                                  Positioned(
                                      top: 8,
                                      left: 8,
                                      child: _IconStar(Icons.star, '4.9'))
                                ],
                              ),
                              SizedBox(
                                width: 130,
                                child: Text(
                                  '${bookRecommended.title}',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                child: Text(
                                  '${bookRecommended.price}',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color:
                                      Color.fromARGB(255, 165, 163, 163)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            )
          ),
        ],
      );
  }
}

Widget _IconStar(IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.black),
    child: Row(
      children: [
        Icon(
          icon,
          size: 12,
          color: Colors.yellow,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
        )
      ],
    ),
  );
}
