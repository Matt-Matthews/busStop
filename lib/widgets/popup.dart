import 'package:BusStop/widgets/pricing.dart';
import 'package:BusStop/widgets/schedules.dart';
import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  const PopUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 180,
        width: 190,
        child: W_Pricing(),
      ),
    );
  }
}

class PopUp2 extends StatelessWidget {
  const PopUp2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        content: Container(
          child: W_Schedules(),
        ));
  }
}
