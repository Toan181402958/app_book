import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_book/model/book_api_item.dart';

class CallBookItem{
  Future<BookItem> getBookRecommended(String keySearch) async{
    var result = Uri.parse('https://api.itbook.store/1.0/books/$keySearch');
    var response = await http.get(result);
    var body = jsonDecode(response.body);
    return BookItem.fromJson(body);
  }
}