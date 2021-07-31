import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static late final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;
  DatabaseHelper._instance();
  String patientTable = "patientTable";
  String colId = "id";
  String colAge = "age";
  String colSupineHeartRate = "supineHeartRate";
  String colStatus = "status";

//Patient Tables
//Id|| Age ||SupineHeartRate ||Status
//0    ""        ""                ""

  Future<Database?> get db async {
    Database? _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "patient.db";
    final patientDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return patientDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $patientTable($colId INTERGER PRIMARY KEY AUTOINCREMENT,$colAge TEXT,$colSupineHeartRate TEXT,$colStatus TEXT)");
  }

  Future<List<Map<String, dynamic>>> getPatientList() async {
    Database? db = await this.db;

    final List<Map<String, dynamic>> result = await db.query(patientTable);
    return result;
  }
}
