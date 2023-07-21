import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/google_book.dart';

class GoogleBooksService {
  static const String baseUrl = "https://www.googleapis.com/books/v1/volumes";

  Future<List<GoogleBook>> searchBooks(String name) async {
    if(name != "") {
      http.Response httpResponse = await http.get(Uri.parse("$baseUrl/?q=$name"));

      Map<String, dynamic> response = json.decode(httpResponse.body);
      List listResponse = response["items"];

      List<GoogleBook> listResult = [];
      for (int i = 0; i < listResponse.length; i++) {
        listResult.add(GoogleBook.fromApi(listResponse[i]));
      }

      return listResult;
    }
    return List.empty();
  }
}
