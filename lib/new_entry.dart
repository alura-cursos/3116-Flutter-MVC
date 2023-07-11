import 'package:flutter/material.dart';
import 'date_input.dart';
import 'display_text.dart';
import 'entry.dart';
import 'primary_button.dart';
import '../theme.dart';

import 'home.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({super.key,});

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController initialDateController = TextEditingController();
  final TextEditingController finalDateController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: DisplayText("Adicionando um Livro"),
                ),
                SizedBox(
                  width: 244,
                  child: Column(
                    children: <Widget>[
                      // Entry(book: "Book"),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Text("Book Description"),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: DateInput(
                                  textController: initialDateController,
                                  label: "Início da Leitura"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: DateInput(
                                  textController: finalDateController,
                                  label: "Final da Leitura"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: TextFormField(
                                controller: commentsController,
                                decoration: InputDecorationProperties
                                    .newInputDecoration(
                                  "",
                                  "Comentários",
                                ),
                                maxLines: 5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: PrimaryButton(
                                  text: "Adicionar",
                                  onTap: () {
                                    // Needs add book logic

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()),
                                      (_) => false,
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
