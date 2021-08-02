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
    if (_database == null) {
      _database = await _initDb();
    }

    return _database!;
  }

  Future<Database?> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "patient.db";
    final patientDb = await openDatabase(path, version: 10, onCreate: createDb);
    return patientDb;
  }

  Future close() async {
    final db = await instance.db;
    db!.close();
  }

  Future createDb(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';

    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    await db.execute('''
        CREATE TABLE $patientTable(
        ${PatientFields.columnId} $idType,
        ${PatientFields.colAge} $integerType,
        ${PatientFields.colSupineHeartRate} $integerType,
        ${PatientFields.colStatus} $integerType,
        ${PatientFields.colIsChecked} $integerType
        )
        ''');
  }

  Future<int?> createPatient(Patient patient) async {
    final db = await this.db;
    final int? result = await db?.insert(patientTable, patient.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    //
    return result;
  }

  Future<List<Map<String, Object?>>?>? readAllPatientData() async {
    final db = await this.db;

    final orderBy = '${PatientFields.columnId} ASC';
    final completedTest = '${PatientFields.colIsChecked}==0';

    final result =
        await db?.query(patientTable, orderBy: orderBy, where: completedTest);
    return result;
  }

  Future<List<Map<String, Object?>>?>? sortAllPatientData() async {
    final db = await this.db;

    //final orderBy = '${PatientFields.columnId} ASC';
    final completedTest = '${PatientFields.colIsChecked}==0';

    final result = await db?.query(patientTable, where: completedTest);
    return result;
  }

  Future<List<Patient>> getPatientList() async {
    final patientList = await readAllPatientData();

    final List<Patient> listPatient = [];
    patientList?.forEach((patientMap) {
      listPatient.add(Patient.fromMap(patientMap));
    });
    return listPatient;
  }

  Future<int?> delete(int id) async {
    final db = await this.db;

    final int? result = await db?.delete(
      patientTable,
      where: '${PatientFields.columnId} = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int?> update(Patient patient) async {
    final db = await this.db;

    final int? result = await db?.update(
      patientTable,
      patient.toMap(),
      where: '${PatientFields.columnId} = ?',
      whereArgs: [patient.id],
    );
    return result;
  }
}
