import 'package:BusStop/backends/pointsData.dart';
import 'package:BusStop/widgets/header.dart';
import 'package:flutter/material.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            W_Header(),
            SizedBox(
              height: 20,
            ),
            Text('Loyality Points',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffbF4511E),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                  PointsData.points.toStringAsFixed(2).toString() + ' points',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                  'Get 0.05 Points on every R1.00 you spent. 5 points is equal to R10.00. Points cannot be redeemed for rewards, but can be spent to buy a ticket.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
