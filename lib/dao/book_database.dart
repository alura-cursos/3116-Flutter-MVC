// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/personal_book.dart';

class PersonalBookDatabase {
  static const String _tableName = "bookTable";
  static const String _id = "id";
  static const String _dayStarted = "dayStarted";
  static const String _dayFinished = "dayFinished";
  static const String _comments = "comments";
  static const String _googleBook = "googleBook";
 
  static const String createTableSQL =
      // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
      "CREATE TABLE $_tableName($_id INTEGER NOT NULL PRIMARY KEY," +
          "$_dayStarted TEXT," +
          "$_dayFinished TEXT," +
          "$_comments TEXT," +
          "$_googleBook TEXT" +
          ")";

  Future<Database> _getDatabase() async {
    final String path = join(await getDatabasesPath(), "book.db");
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(createTableSQL);
      },
      version: 1,
    );
  }

  Future<void> save(PersonalBook book) async {
    print("SAVE");

    Map<String, dynamic> bookMap = book.toMap();

    final Database database = await _getDatabase();

    if (book.id == null) {
      print("CREATING ${book.googleBook.title}");
      await database.insert(_tableName, bookMap);
    } else {
      print("UPDATING ${book.googleBook.title}");
      await database.update(
        _tableName,
        bookMap,
        where: "$_id = ?",
        whereArgs: [book.id],
      );
    }
  }

  Future<List<PersonalBook>> findAll() async {
    print("FIND ALL");

    final Database database = await _getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);

    print(result);

    return _toList(result);
  }

  Future<List<PersonalBook>> _find(String column, dynamic arg) async {
    print("FIND");
    final Database database = await _getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tableName,
      where: "$column = ?",
      whereArgs: [arg],
    );
    print(result);
    return _toList(result);
  }

  Future<PersonalBook> findById(int id) async {
    List<PersonalBook> result = await _find(_id, id);
    if (result.isNotEmpty) {
      return result[0];
    }
    throw PersonalBookNotFindException();
  }

  Future<void> delete(PersonalBook book) async {
    print("DELETE");

    final Database database = await _getDatabase();

    await database.delete(
      _tableName,
      where: "$_id = ?",
      whereArgs: [book.id],
    );
  }

  List<PersonalBook> _toList(List<Map<String, dynamic>> result) {
    final List<PersonalBook> listPost = [];
    for (Map<String, dynamic> map in result) {
      listPost.add(
        PersonalBook.fromMap(map),
      );
    }
    return listPost;
  }
}

class PersonalBookNotFindException implements Exception {}
