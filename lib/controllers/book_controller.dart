import '../dao/book_database.dart';
import '../models/google_book.dart';
import '../models/personal_book.dart';

class BookController {
  final PersonalBookDatabase _dao = PersonalBookDatabase();

  void addBook(GoogleBook googleBook, String initialDate, String finalDate,
      String comments) {
    final PersonalBook newPersonalBook = PersonalBook(
        dayFinished: finalDate,
        comments: comments,
        dayStarted: initialDate,
        googleBook: googleBook);
    _dao.save(newPersonalBook);
  }

  void updateBook(PersonalBook personalBook) {
    _dao.save(personalBook);
  }

  Future<List<PersonalBook>> getBooks() async {
    final List<PersonalBook> list = await _dao.findAll();
    return list;
  }

  void removeBook(PersonalBook personalBook){
    _dao.delete(personalBook);
  }
}
