import 'package:flutter/material.dart';
import 'package:rmd_timetable/data/entities/state_entity.dart';

class StateListView extends StatelessWidget {
  final int itemCount;
  final Function onTap;
  final List<StateEntity> states;

  StateListView({this.itemCount, this.onTap, this.states});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ListTile(
            key: Key(states[index].id),
            title: Text(states[index].name),
            onTap: onTap,
          );
        });
  }
}
