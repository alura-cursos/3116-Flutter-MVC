import 'package:flutter/material.dart';
import 'package:grimorio/theme.dart';

class Entry extends StatelessWidget {
  const Entry({super.key,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(
              "Image Link",
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
                  child: Text("Book Title", style: EntryDecorationProperties.displayText,),
                ),
                Text("Book Authors", style: EntryDecorationProperties.authorText,),
              ],
            ),
          ),
      ],),
    );
  }
}
