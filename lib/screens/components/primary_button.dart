import 'package:flutter/material.dart'; 
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/theme.dart'; 

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const String stars = "assets/images/star_icon.svg";
    return InkWell(
      onTap: onTap,
      child: Container(
        width: PrimaryButtonProperties.size,
        decoration: PrimaryButtonProperties.boxDecoration,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(stars),
            ),
            Text(
              text,
              style: PrimaryButtonProperties.textStyle,
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

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon({super.key, required this.text, required this.icon, required this.onTap});
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const String stars = "assets/images/alternative_star_icon.svg";
    return InkWell(
      onTap: onTap,
      child: Container(
        width: PrimaryButtonProperties.size,
        decoration: PrimaryButtonProperties.boxDecoration,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(stars),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(icon, color: PrimaryButtonProperties.iconColor,),
            ),
            Text(
              text,
              style: PrimaryButtonProperties.textStyle,
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
