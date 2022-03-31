import 'package:app_book/contains/font_text.dart';
import 'package:app_book/screen/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_book/model/book.dart';

class TrendingBook extends StatefulWidget {
  const TrendingBook({Key? key}) : super(key: key);

  @override
  State<TrendingBook> createState() => _TrendingBookState();
}

class _TrendingBookState extends State<TrendingBook> {
  var ListTrendingBook = Book.generateTrendingBook();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Trending Book',
              style: CommemdedStyle,
            ),
            Text(
              'See more',
              style: SeeMoreStyle,
            )
          ],
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            var book = ListTrendingBook[index];
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ReadBook(book: book,
                //         )));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TestWidget(),
                        settings: RouteSettings(arguments: book)));
              },
              child: SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          '${book.imgUrl}',
                          height: 150,
                          width: 100,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleWidgetTrending(
                                '${book.name}', Icons.bookmark),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 4, 0, 10),
                              child: Text(
                                '${book.author}',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                            ),
                            Text(
                              '${book.desc}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: ViewWidget(
                                  Icons.star,
                                  '${book.score}',
                                  '${book.review}',
                                  Icons.remove_red_eye_rounded,
                                  '${book.view}'),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, int index) => const SizedBox(
            width: 15,
          ),
          itemCount: ListTrendingBook.length,
        ),
      ],
    );
  }
}

Widget TitleWidgetTrending(String name, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Icon(
        icon,
        size: 16,
        color: Colors.yellow,
      )
    ],
  );
}

Widget ViewWidget(IconData iconStar, String score, String review,
    IconData iconEye, String view) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
        child: Icon(
          iconStar,
          color: Colors.yellow,
          size: 14,
        ),
      ),
      Text(
        '$score($review k)',
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 2, 0),
        child: Icon(
          iconEye,
          color: Colors.white,
          size: 14,
        ),
      ),
      Text(
        view + 'M Read',
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
      ),
    ],
  );
}
