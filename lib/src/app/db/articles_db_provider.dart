import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../db.dart';
import 'package:common/common.dart' show Article, ArticlesService;

class ArticlesDbProvider {
  // Database _db = dbClient.db();
  String _dbName = 'articles';
  ArticlesDbProvider() {}

  // Todo - store and fetch top ids
  Future<List<int>> fetchTopIds() {
    return null;
  }

  // void init() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   final path = join(documentsDirectory.path, ".db");
  //   db = await openDatabase(
  //     path,
  //     version: 1,
  //     onCreate: (Database newDb, int version) {
  //       newDb.execute('CREATE TABLE Items($props)');
  //     },
  //   );
  // }
  Future<Article> getItems() async {
    print("get items");

    var _db = await DatabaseClient().db;
    if (_db != null) {
      print(" db is : " + _db.toString());
    }
    final maps = await _db.query("$_dbName");

    if (maps.length > 0) {
      print(" Items from db: " + maps.toString());
      // return Article.fromDb(maps.first);
    } else {
      print("items is null");
    }

    return null;
  }

  Future<Article> getItem(String id) async {
    var _db = await DatabaseClient().db;
    final maps = await _db.query(
      "$_dbName",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      print(" Items from db: " + maps.toString());
      // return Article.fromDb(maps.first);
    }

    return null;
  }

  Future<int> create(Article item) async {
    var db = await DatabaseClient().db;
    return db.insert(
      "$_dbName",
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> update(Article item) {
    // return db.insert(
    //   "Items",
    //   item.toMap(),
    //   conflictAlgorithm: ConflictAlgorithm.ignore,
    // );
  }
  Future<int> delete(Article item) {
    // return db.insert(
    //   "Items",
    //   item.toMap(),
    //   conflictAlgorithm: ConflictAlgorithm.ignore,
    // );
  }

  clear() async {
    var _db = await DatabaseClient().db;

    return _db.delete("$_dbName");
  }
}
