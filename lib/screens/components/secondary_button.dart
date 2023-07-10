import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/theme.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.text, this.icon, required this.onTap});
  final String text;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const String stars = "assets/images/alternative_star_icon.svg";
    return InkWell(
      onTap: onTap,
      child: Container(
        width: SecondaryButtonProperties.size,
        decoration: SecondaryButtonProperties.boxDecoration,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(stars),
            ),
            icon != null ?
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(icon, color: SecondaryButtonProperties.iconColor,),
            ) : Container(),
            Text(
              text,
              style: SecondaryButtonProperties.textStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(stars),
            ),
          ],
        ),
      ),
    );
  } 
}
