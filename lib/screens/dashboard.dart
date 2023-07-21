import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/screens/login.dart';
import 'package:grimorio/screens/components/primary_button.dart';
import 'package:grimorio/theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      decoration: AppBackgroundProperties.boxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/images/background.svg"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset("assets/images/logo.svg"),
                    Padding(
                      padding: const EdgeInsets.only(top: 104.0),
                      child: PrimaryButton(text: "Entrar", onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
                      },),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
