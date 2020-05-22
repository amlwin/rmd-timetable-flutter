import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmd_timetable/models/state.dart';
import 'package:rmd_timetable/vm/chooser_view_model.dart';
import 'package:rmd_timetable/widgets/state_list_view.dart';

class ChooserSheet extends StatefulWidget {
  @override
  _ChooserSheetState createState() => _ChooserSheetState();
}

class _ChooserSheetState extends State<ChooserSheet> {
  @override
  void initState() {
    super.initState();
    Provider.of<ChooserViewModel>(context, listen: false).loadStateList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Myanmar",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          SizedBox(height: 8),
          Text("Choose State...",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey)),
          SizedBox(height: 4),
          Expanded(
              child: context.watch<ChooserViewModel>().loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : StateListView(
                      itemCount: context.select<ChooserViewModel, int>(
                        (value) => value.stateList.length,
                      ),
                      onTap: () {},
                      states:
                          context.select<ChooserViewModel, List<StateResponse>>(
                              (value) => value.stateList),
                    ))
        ],
      ),
    );
  }
}
