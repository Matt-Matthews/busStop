import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

// ignore: camel_case_types
class W_RadioGroup extends StatelessWidget {
  final List<String> _label;
  final GroupedButtonsOrientation _orientation;
  W_RadioGroup(
    this._label,
    this._orientation,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: RadioButtonGroup(
        orientation: _orientation,
        labels: _label,
        activeColor: Color(0xffbF4511E),
        labelStyle: TextStyle(color: Color(0xffbF4511E)),

        /*onSelected: (String selected) => setState(() {
          _picked = selected;
          print(_picked.toString());
          payType = _picked.toString();
        }),
        picked: _picked,*/
        itemBuilder: (Radio rb, Text txt, int i) {
          return Row(
            children: [rb, txt],
          );
        },
      ),
    );
  }
}
