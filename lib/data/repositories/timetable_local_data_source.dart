import 'dart:async';

import 'package:path/path.dart';
import 'package:rmd_timetable/data/entities/state_entity.dart';
import 'package:rmd_timetable/data/models/state.dart';
import 'package:sqflite/sqflite.dart';

class TimetableLocalDataSource {
  final String _dbName = "timetable_database.db";

  Database _database;

  Future setup() async {
    _database = await openDatabase(join(await getDatabasesPath(), _dbName),
        version: 1, onCreate: _onCreateDatabase);
  }

  FutureOr _onCreateDatabase(Database db, int version) {
    return db.execute(
        "CREATE TABLE ${StateEntity.tableName}(${StateEntity.idColumn} TEXT PRIMARY KEY, ${StateEntity.nameColumn} TEXT)");
  }

  void saveStateList(List<StateResponse> apiResponse) {
    apiResponse.forEach((StateResponse element) async {
      await _database.insert(
          StateEntity.tableName,
          {
            StateEntity.idColumn: element.objectId,
            StateEntity.nameColumn: element.nameMmUni
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<StateEntity>> getAllState() async {
    final List<Map<String, dynamic>> result = await _database.query(
        StateEntity.tableName,
        columns: [StateEntity.idColumn, StateEntity.nameColumn],
        orderBy: StateEntity.nameColumn);

    final List<StateEntity> stateList = result
        .map((Map<String, dynamic> e) => StateEntity.fromDatabase(e))
        .toList(growable: false);

    return stateList;
  }
}
