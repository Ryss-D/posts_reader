import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  //Database is a type provided by sqflite papcakge
  static Future<Database> database() async {
    //getDatabaesPath method search for the location dependly of the operaing system
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'posts.db'),
      //this is the method who will be executed if we try to open the
      //db file and didnt find anythings
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE posts(post_id INTEGER PRIMARY KEY, user_id INTEGER, title TEXT, body TEXT, is_favorite INTEGER)');

        await db.execute(
            'CREATE TABLE authors(user_id INTEGER PRIMARY KEY, name TEXT, username TEXT,  email TEXT, address_street TEXT, address_suite TEXT, address_city TEXT, address_zipcode TEXT, geo_lat TEXT, geo_lng TEXT, phone TEXT, website TEXT, company_name TEXT, company_catchphrase TEXT, company_bs TEXT)');

        await db.execute(
          'CREATE TABLE comments(comment_id INTEGER PRIMARY KEY, post_id INTEGER, name TEXT, email TEXT, body TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
