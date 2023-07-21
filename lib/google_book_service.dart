import 'dart:convert';

import 'package:http/http.dart' as http;

class GoogleBooksService {
  static const String baseUrl = "https://www.googleapis.com/books/v1/volumes";

  Future<List<dynamic>> searchBooks(String name) async {
    if(name != "") {
      http.Response httpResponse = await http.get(Uri.parse("$baseUrl/?q=$name"));

      Map<String, dynamic> response = json.decode(httpResponse.body);
      List listResponse = response["items"];

      List<dynamic> listResult = [];
      for (int i = 0; i < listResponse.length; i++) {
        // listResult.add("Need a JSON converter");
      }

      return listResult;
    }
    return List.empty();
  }
}

class GoogleBook {
  late String id;
  late String title;
  late String authors;
  late String description;
  late String thumbnailLink;

  GoogleBook({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnailLink,
  });

  GoogleBook.fromApi(Map<String, dynamic> map) {
    id = map["id"];
    title = map["volumeInfo"]["title"];
    authors = (map["volumeInfo"]["authors"] as List<dynamic>).map((e) => e).toString();
    description = map["volumeInfo"]["description"];
    thumbnailLink = map["volumeInfo"]["imageLinks"]?["thumbnail"];
  }

  GoogleBook.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    authors = map["authors"];
    description = map["description"];
    thumbnailLink = map["thumbnailLink"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "authors": authors,
      "description": description,
      "thumbnailLink": thumbnailLink,
    };
  }
}
