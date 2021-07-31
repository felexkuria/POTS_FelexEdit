import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pots_new/models/patient.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static late final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;
  DatabaseHelper._instance();

//Patient Tables
//Id|| Age ||SupineHeartRate ||Status
//0    ""        ""                ""

  Future<Database?> get db async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database?> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "patient.db";
    final patientDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return patientDb;
  }

  Future close() async {
    final db = await instance.db;
    db!.close();
  }

  Future _createDb(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    await db.execute('''
        CREATE TABLE $patientTable(
        ${PatientFields.columnId} $idType,
        ${PatientFields.colAge} $integerType,
        ${PatientFields.colSupineHeartRate} $integerType,
        ${PatientFields.colStatus} $integerType,
        ${PatientFields.colIsChecked} $boolType
        )
        ''');
  }

  Future<Patient> create(Patient patient) async {
    final db = await instance.db;
    final id = await db!.insert(patientTable, patient.toJson());
    return patient.copy(id: id);
  }

  Future<Patient> readPatientData(int id) async {
    final db = await instance.db;
    final maps = await db?.query(patientTable,
        columns: PatientFields.values,
        where: "${PatientFields.columnId}=?",
        whereArgs: [id]);

    return Patient.fromJson(maps!.first);
  }

  Future<List<Patient>> readAllPatientData() async {
    final db = await instance.db;

    final orderBy = '${PatientFields.columnId} ASC';

    final result = await db?.query(patientTable, orderBy: orderBy);
    return result!.map((json) => Patient.fromJson(json)).toList();
  }

  Future<int?> delete(int id) async {
    final db = await instance.db;

    return await db?.delete(
      patientTable,
      where: '${PatientFields.columnId} = ?',
      whereArgs: [id],
    );
  }

  Future<int?> update(Patient patient) async {
    final db = await instance.db;

    return db?.update(
      patientTable,
      patient.toJson(),
      where: '${PatientFields.columnId} = ?',
      whereArgs: [patient.id],
    );
  }
}
