import 'package:flutter/material.dart';
import 'package:rmd_timetable/screens/list_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(),
      },
    );
  }
}
