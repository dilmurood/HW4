import 'dart:ui';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pth;
import 'dart:async';

class DBHelper {
  DBHelper._privateConstructor();

  static DBHelper dbHelper = DBHelper._privateConstructor();
  late Database _db;

  Future<Database> get db async {
    _db = await _initDatabase();
    return _db;
  }

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = pth.join(databasesPath, 'user.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE user (id INTEGER PRIMARY KEY, username TEXT, password TEXT, phone TEXT, email TEXT, address TEXT)');

    print('created successfully');
  }

  Future<int> InsertData(Map<String, dynamic> row) async {
    var dbClient = await db;
    return await dbClient.insert('user', row);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    var database = await db;
    return await database.query('user');
  }
  // Future<List<Map<String, dynamic>>> getDatabyName(String name) async {
  //     Database db = await db;
  //     return await db.query("User", where: "id=?", whereArgs: [name]);
  //   }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  Picture? picture;
  
  User({required this.id, required this.firstName, required this.lastName, required this.email});
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['name'],
      lastName: json['email'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };
    return map;
  }
}
