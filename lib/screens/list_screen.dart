import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmd_timetable/screens/chooser_sheet.dart';
import 'package:rmd_timetable/vm/chooser_view_model.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Title"),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          context: context,
                          builder: (context) => ChangeNotifierProvider(
                              create: (_) => ChooserViewModel(),
                              child: ChooserSheet()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
