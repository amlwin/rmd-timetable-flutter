import 'package:flutter/material.dart';
import 'package:rmd_timetable/app.dart';
import 'package:rmd_timetable/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(App());
}
