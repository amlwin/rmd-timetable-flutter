import 'package:flutter/material.dart';
import 'package:rmd_timetable/data/timetable_local_data_source.dart';
import 'package:rmd_timetable/data/timetable_remote_data_source.dart';
import 'package:rmd_timetable/models/state.dart';
import 'package:rmd_timetable/service_locator.dart';

class TimetableRepository with ChangeNotifier {
  final TimetableRemoteDataSource remoteDataSource =
      serviceLocator<TimetableRemoteDataSource>();
  final TimetableLocalDataSource localDataSource =
      serviceLocator<TimetableLocalDataSource>();

//  TimetableRepository(this.remoteDataSource, this.localDataSource) {
//    this.notifyListeners();
//  }

  Future<List<StateResponse>> getStateList() async {
    final List<StateResponse> apiResponse =
        await remoteDataSource.getStateList();

    //localDataSource.saveStateList(apiResponse);
    return apiResponse;
  }
}
