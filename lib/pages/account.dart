import 'package:BusStop/backends/pointsData.dart';
import 'package:BusStop/backends/ticketData.dart';
import 'package:BusStop/widgets/header.dart';
import 'package:BusStop/backends/user.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              W_Headers(),
              Container(
                height: 150,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffbF4511E))),
                child: Text(
                  User.firstname[0].toUpperCase(),
                  style: TextStyle(
                      color: Color(0xffbF4511E),
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  User.firstname.toUpperCase() +
                      ' ' +
                      User.lastname.toUpperCase(),
                  style: TextStyle(
                      color: Color(0xffbF4511E),
                      fontSize: 25,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                color: Color(0xffbF4511E),
                height: 35,
                width: 250,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      PointsData.points.toStringAsFixed(2).toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      TicketData.total.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 250,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Points',
                      style: TextStyle(
                          color: Color(0xffbF4511E),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      'Tickets',
                      style: TextStyle(
                          color: Color(0xffbF4511E),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
