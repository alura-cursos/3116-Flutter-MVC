import 'package:flutter/material.dart';

import '../theme.dart';
import 'display_text.dart';
import 'primary_button.dart';
import 'secondary_button.dart';
import 'edit_details.dart';
import 'home.dart';

class BookDetails extends StatefulWidget {
  BookDetails({super.key,});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: DisplayText("Detalhes do Livro"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Image.network(
                      "Image Link",
                      height: 220,
                      width: 144,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Book Title",
                      style: ModalDecorationProperties.bookTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "Book Authors",
                        style: ModalDecorationProperties.bookAuthor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Book Description",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.mediumPink,
                          ),
                        ),
                        Text(
                          "Inicio da Leitura",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(children: <Widget>[
                      Text(
                        "Day started",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.mediumPink,
                          ),
                        ),
                        Text(
                          "Day Started",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(children: <Widget>[
                      Text(
                        "Day Finished",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Comentários",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Row(
                      children: [
                        Expanded(child: Text("Book Comments")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PrimaryButtonIcon(
                      icon: Icons.edit,
                      text: "Editar",
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => EditDetails(
                        //               book: "book",
                        //             ))).then((value) {
                        //   setState(() {
                        //     if (value != null) {
                        //       "Update book";
                        //     }
                        //   });
                        // });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SecondaryButton(
                      icon: Icons.delete,
                      text: "Excluir",
                      onTap: () {
                        // Delete book
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const Home()),
                        //   (_) => false,
                        // );
                      },
                    ),
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
