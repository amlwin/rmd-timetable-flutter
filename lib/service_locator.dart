import 'package:get_it/get_it.dart';
import 'package:rmd_timetable/data/timetable_local_data_source.dart';
import 'package:rmd_timetable/data/timetable_remote_data_source.dart';
import 'package:rmd_timetable/data/timetable_repository.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingletonAsync<TimetableRemoteDataSource>(
      () async => TimetableRemoteDataSource());

  serviceLocator.registerSingletonAsync<TimetableLocalDataSource>(
      () async => TimetableLocalDataSource());

  serviceLocator.registerSingletonWithDependencies<TimetableRepository>(
      () => TimetableRepository(),
      dependsOn: [TimetableLocalDataSource, TimetableRemoteDataSource]);
}
