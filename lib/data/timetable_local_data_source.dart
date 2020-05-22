import 'dart:async';

import 'package:path/path.dart';
import 'package:rmd_timetable/models/state.dart';
import 'package:sqflite/sqflite.dart';

class TimetableLocalDataSource {
  final String _dbName = "timetable_database.db";

  Future<Database> database;

  void setup() async {
    database = openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: _onCreateDatabase);
  }

  FutureOr _onCreateDatabase(Database db, int version) {
    return db.execute("");
  }

  void saveStateList(List<StateResponse> apiResponse) {}
}
