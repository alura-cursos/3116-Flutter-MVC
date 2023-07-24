import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/controller/book_controller.dart';

import '../../theme.dart';
import '../models/personal_book.dart';
import 'book_details.dart';
import 'components/display_text.dart';
import 'components/floating_button.dart';
import 'search_books.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final BookController bookController = BookController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: AppBackgroundProperties.boxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          // Need connection with sqflite
          child: FutureBuilder(
            future: bookController.getBooks(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return _FilledHome(listPersonalBook: snapshot.data!);
                  }
                  break;
                default:
                  break;
              }
              return const _EmptyHome();
            },
          ),
        ),
      ),
    ));
  }
}

// Filled Home widget
class _FilledHome extends StatefulWidget {
  _FilledHome({required this.listPersonalBook});

  List<PersonalBook> listPersonalBook;

  @override
  State<_FilledHome> createState() => _FilledHomeState();
}

class _FilledHomeState extends State<_FilledHome> {

  final BookController bookController = BookController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 48.0, 0.0, 8.0),
                  child: DisplayText("Grimório"),
                ),
              ),
              SliverGrid.builder(
                itemCount: widget.listPersonalBook.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 167,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetails(
                          personalBook: widget.listPersonalBook[index],
                        ),
                      ),
                    ).then((value) async {
                      widget.listPersonalBook = await bookController.getBooks();
                      setState(() { });
                    });
                  },
                  child: Image.network(
                    widget.listPersonalBook[index].googleBook.thumbnailLink,
                    height: 220,
                    width: 144,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 72,
            width: MediaQuery.of(context).size.width,
            decoration: HomeShadowProperties.boxDecoration,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 125,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: FloatingButton(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchBooks()));
            },
          ),
        ),
      ],
    );
  }
}

class _EmptyHome extends StatelessWidget {
  const _EmptyHome();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const Padding(
        padding: EdgeInsets.only(bottom: 32.0),
        child: DisplayText("Grimório"),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: SvgPicture.asset("assets/images/grimorio_empty.svg"),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Seu Grimório está vazio!",
          style: TextStyle(
              fontFamily: "Bigelow Rules",
              fontSize: 36,
              color: AppColors.lightPink),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 40.0),
        child: Text(
          "Vamos aprender algo novo?",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      FloatingButton(onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchBooks()));
      }),
    ]);
  }
}
