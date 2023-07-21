import 'package:flutter/material.dart';
import 'package:grimorio/screens/components/display_text.dart';
import 'package:grimorio/screens/components/primary_button.dart';
import 'package:grimorio/theme.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      decoration: AppBackgroundProperties.boxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: DisplayText("Cadastre-se"),
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
                            decoration:
                                InputDecorationProperties.newInputDecoration(
                                    "Seu nome aqui", "Nome"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: TextFormField(
                            style: InputDecorationProperties.textDecoration,
                            decoration:
                                InputDecorationProperties.newInputDecoration(
                                    "seuemail@dominio.com", "E-mail"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            style: InputDecorationProperties.textDecoration,
                            decoration:
                                InputDecorationProperties.newInputDecoration(
                                    "******", "Senha"),
                            obscureText: true,
                          ),
                        ),
                        PrimaryButton(text: "Cadastrar", onTap: () {}),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size.fromWidth(246),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Fazer login",
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
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
