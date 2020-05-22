import 'package:flutter/material.dart';
import 'package:rmd_timetable/data/entities/state_entity.dart';
import 'package:rmd_timetable/data/repositories/timetable_repository.dart';
import 'package:rmd_timetable/service_locator.dart';

class ChooserViewModel with ChangeNotifier {
  final TimetableRepository repository = serviceLocator<TimetableRepository>();
  bool _loading = false;

  bool get loading => _loading;

  List<StateEntity> _stateList = [];

  List<StateEntity> get stateList => _stateList;

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
