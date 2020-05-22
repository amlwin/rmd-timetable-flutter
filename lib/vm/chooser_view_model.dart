import 'package:flutter/material.dart';
import 'package:rmd_timetable/data/timetable_repository.dart';
import 'package:rmd_timetable/models/state.dart';
import 'package:rmd_timetable/service_locator.dart';

class ChooserViewModel with ChangeNotifier {
  final TimetableRepository repository = serviceLocator<TimetableRepository>();
  bool _loading = false;

  bool get loading => _loading;

  List<StateResponse> _stateList = [];

  List<StateResponse> get stateList => _stateList;

  void loadStateList() {
    _getStateListFromApi();
  }

  void _getStateListFromApi() async {
    _loading = true;
    print("type of repo ${repository.runtimeType}");
    _stateList = await repository.getStateList();
    _loading = false;
    notifyListeners();
  }
}
