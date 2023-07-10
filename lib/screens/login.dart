import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/screens/components/display_text.dart';
import 'package:grimorio/screens/home.dart';
import 'package:grimorio/screens/components/primary_button.dart';
import 'package:grimorio/screens/sign_up.dart';
import 'package:grimorio/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SvgPicture.asset("assets/images/more_stars.svg"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: DisplayText("Login"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Image.asset("assets/images/grimorio.png"),
                      ),
                      SizedBox(
                        width: 246,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: TextFormField(
                                  style: InputDecorationProperties.textDecoration,
                                  decoration: InputDecorationProperties.newInputDecoration("seuemail@dominio.com", "E-mail"),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              TextFormField(
                                style: InputDecorationProperties.textDecoration,
                                decoration: InputDecorationProperties.newInputDecoration("******", "Senha"),
                                obscureText: true,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 28.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0)),
                                  onPressed: () {},
                                  child: const Text(
                                    "Esqueci a senha",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              PrimaryButton(text: "Entrar", onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                              }),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    fixedSize: const Size.fromWidth(246),
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Signup()));
                                  },
                                  child: Text(
                                    "Cadastre-se",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
