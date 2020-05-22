import 'package:flutter/material.dart';
import 'package:rmd_timetable/models/state.dart';

class StateListView extends StatelessWidget {
  final int itemCount;
  final Function onTap;
  final List<StateResponse> states;

  StateListView({this.itemCount, this.onTap, this.states});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(states[index].nameMmUni),
            onTap: onTap,
          );
        });
  }
}
