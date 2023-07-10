import 'dart:convert';

import 'package:grimorio/models/google_book.dart';

class PersonalBook {
  int? id; // Quem dá esse id é o SQFLITE
  String dayStarted;
  String dayFinished;
  String comments;
  GoogleBook googleBook;

  PersonalBook({
    this.id,
    required this.dayFinished,
    required this.comments,
    required this.dayStarted,
    required this.googleBook,
  });

  PersonalBook.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        dayFinished = map["dayFinished"],
        dayStarted = map["dayStarted"],
        comments = map["comments"],
        googleBook = GoogleBook.fromJson(json.decode(map["googleBook"]));


  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "dayFinished": dayFinished.toString(),
      "dayStarted": dayStarted.toString(),
      "comments": comments,
      "googleBook": json.encode(googleBook.toMap()),
    };
  }
}
