import 'package:flutter/material.dart';
import 'package:grimorio/models/google_book.dart';
import 'package:grimorio/theme.dart';

class Entry extends StatelessWidget {
  Entry({super.key, required this.googleBook});

  GoogleBook googleBook;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(
              googleBook.thumbnailLink,
              height: 126,
              width: 86,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(googleBook.title, style: EntryDecorationProperties.displayText,),
                ),
                Text(googleBook.authors, style: EntryDecorationProperties.authorText,),
              ],
            ),
          ),
      ],),
    );
  }
}
