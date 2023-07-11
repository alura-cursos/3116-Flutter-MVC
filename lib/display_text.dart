import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/theme.dart';

class DisplayText extends StatelessWidget {
  const DisplayText(this.text, {super.key});
  final String text;
  final String asset = "assets/images/star_icon.svg";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(asset),
        ),
        Text(text, style: DisplayTextProperties.textStyle,),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SvgPicture.asset(asset),
        )
    ],);
  }
}
