import 'package:flutter/material.dart';

class StateDropDownButton extends StatelessWidget {
  const StateDropDownButton({
    Key key,
    @required List<String> dropDownItem,
  })  : _dropDownItem = dropDownItem,
        super(key: key);

  final List<String> _dropDownItem;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.caption,
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
          hintText: 'Please select expense',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isDense: true,
          items: _dropDownItem
              .map((value) => DropdownMenuItem(
                    child: Text(value),
                  ))
              .toList(growable: false),
          onChanged: (value) => print("change value is $value"),
        ),
      ),
    );
  }
}
