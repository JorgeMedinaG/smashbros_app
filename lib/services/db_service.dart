import 'dart:async';

import 'package:path/path.dart';
import 'package:smashbros_app/providers/providers.dart';
import 'package:sqflite/sqflite.dart';


class DBService {


  static Database? _database; 
  static final DBService db = DBService._();
  DBService._();

  //Singleton pattern
  Future<Database?> get database async {

    if (_database != null ) return _database; 

    _database = await initDB();
    return _database; 

  }

  initDB() async {

    final path = join(  await getDatabasesPath(), 'smash_db.db');

    return await openDatabase(
      path, 
      version: 1, 
      onOpen: (db) {}, 
      onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE fighters ( objectID TEXT, name TEXT, universe TEXT, price int, popular INT, rate INT, downloads TEXT, description TEXT, created_at TEXT, imageURL TEXT )"
          );
        }
      );
  }

  Future<void> insertFighter(Fighter fighter) async {

    final db = await database;
    await db?.insert('fighters', fighter.toDBMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<void> insertAllFighters(List<Fighter>  list) async {
    final db = await database;
    db?.delete('fighters');
    for (var fighter in list) {
      await insertFighter(fighter);
    }
  }

  Future<List<Fighter>> fighters() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db!.query('fighters');
    return List.generate(result.length, (index) => Fighter.fromDBMap(result[index]));
  }

  Future<List<Fighter>> fightersByUniverse(String universe) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db!.query('fighters', where: 'universe = ?', whereArgs: [universe]);
    return List.generate(result.length, (index) => Fighter.fromDBMap(result[index]));
  }

}