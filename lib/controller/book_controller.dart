import 'package:grimorio/dao/book_database.dart';
import 'package:grimorio/models/personal_book.dart';

import '../models/google_book.dart';

class BookController {

  PersonalBookDatabase personalBookDatabase = PersonalBookDatabase();

  void addBook(GoogleBook googleBook, String dayStarted, String dayFinished, String comments) {
    PersonalBook newBook = PersonalBook(dayStarted: dayStarted, dayFinished: dayFinished, comments: comments, googleBook: googleBook);
    personalBookDatabase.save(newBook);
  }

  Future<List<PersonalBook>> getBooks() {
    return personalBookDatabase.findAll();
  }

  void updateBook(PersonalBook personalBook) {
    personalBookDatabase.save(personalBook);
  }

  void deleteBook(PersonalBook personalBook) {
    personalBookDatabase.delete(personalBook);
  }
}
