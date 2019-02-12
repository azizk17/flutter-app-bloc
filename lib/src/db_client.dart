import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class DatabaseClient {
  Database _db;
  final String _timestamp = "createdAt Date, updateAt Date";
  DatabaseClient() {
    print("database in ceating in db constructor");
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await create();

    return _db;
  }

  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, "database.db");
    print("################################## # # % Create function");

    return _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
  }

  Future _create(Database db, int version) async {
    await _users(db);
    await _articles(db);
  }

  /*
   *
   *  # Create tables   
   *
   * 
   */
  // create users table

  Future _users(Database db) async {
    print("################################## # # % Users function");
    await db.execute("""
            CREATE TABLE users (
              id TEXT PRIMARY KEY, 
              name TEXT NOT NULL,
              email TEXT NOT NULL,
              $_timestamp
            )
          """);
  }

  // create articles table
  Future _articles(Database db) async {
    await db.execute("""
            CREATE TABLE articles (
              id TEXT PRIMARY KEY, 
              title TEXT NOT NULL,
              body TEXT NOT NULL,
              $_timestamp
            )
          """);
  }
}
