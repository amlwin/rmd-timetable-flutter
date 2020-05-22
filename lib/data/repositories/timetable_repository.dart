import 'package:flutter/material.dart';
import 'package:rmd_timetable/data/entities/state_entity.dart';
import 'package:rmd_timetable/data/models/state.dart';
import 'package:rmd_timetable/data/repositories/timetable_local_data_source.dart';
import 'package:rmd_timetable/data/repositories/timetable_remote_data_source.dart';
import 'package:rmd_timetable/service_locator.dart';

class TimetableRepository with ChangeNotifier {
  final TimetableRemoteDataSource remoteDataSource =
      serviceLocator<TimetableRemoteDataSource>();
  final TimetableLocalDataSource localDataSource =
      serviceLocator<TimetableLocalDataSource>();

//  TimetableRepository(this.remoteDataSource, this.localDataSource) {
//    this.notifyListeners();
//  }

  Future<List<StateEntity>> getStateList() async {
    final List<StateResponse> apiResponse =
    await remoteDataSource.getStateList();

    localDataSource.saveStateList(apiResponse);

    return localDataSource.getAllState();
  }
}
