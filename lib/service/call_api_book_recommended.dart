import 'dart:convert';

import 'package:app_book/model/book_api_recommended.dart';
import 'package:http/http.dart' as http;

class BookRecommendedClient{
  //api: https://api.itbook.store/1.0/new
  Future<BookRecommended> getBookRecommended() async{
    var result = Uri.parse('https://api.itbook.store/1.0/new');
    var response = await http.get(result);
    var body = jsonDecode(response.body);
    return BookRecommended.fromJson(body);
  }

  Future<BookRecommended> fetchBook() async {
    String uri = 'https://api.itbook.store/1.0/new';
    final response = await http.get(Uri.parse(uri));
    if(response.statusCode == 200){
      return BookRecommended.fromJson(jsonDecode(response.body));
    } else{
      throw Exception('Failed to load Book');
    }
  }
}