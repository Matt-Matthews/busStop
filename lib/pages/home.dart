import 'package:BusStop/backends/location.dart';
import 'package:BusStop/backends/pointsData.dart';
import 'package:BusStop/pages/pointsScreen.dart';
import 'package:BusStop/pages/ticketForm.dart';
import 'package:BusStop/widgets/points.dart';
import 'package:flutter/material.dart';
import 'package:BusStop/widgets/header.dart';
import 'package:BusStop/widgets/schedules.dart';
import 'package:BusStop/widgets/pricing.dart';
import 'package:BusStop/backends/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            W_HomeHeader(),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 2),
                        Icon(Icons.location_on, color: Color(0xffbF4511E)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          GetLocation.address,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                        SizedBox(width: 5)
                      ],
                    ),
                  ),
                  SizedBox(width: 150),
                  Container(
                    //height: 35,

                    child: Container(
                      //padding: EdgeInsets.only(left: 140),
                      child: Row(
                        children: [
                          Text(
                            'Points: ' +
                                PointsData.points.toStringAsFixed(2).toString(),
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                )
                              ],
                            ),
                            height: 35,
                            width: 35,
                            alignment: Alignment.center,
                            child: Text(
                              User.firstname[0].toUpperCase() +
                                  User.lastname[0].toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
                height: 170,
                width: 390,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 170,
                      //width: 180,

                      child: ClipRRect(
                        child: Image(
                          image: AssetImage('lib/assets/stop.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                        'Know when your \nbus will arive \nand get to \nthe nearest \nbus stop \nbefore our \nestimated time. ',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              child: Center(child: W_Schedules()),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: W_Pricing(),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  child: W_Points(),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PointsScreen()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TicketForm()));
                },
                child: Container(
                    height: 45,
                    width: 190,
                    alignment: Alignment.center,
                    child: Text('Book a ticket',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                        color: Color(0xffbF4511E),
                        borderRadius: BorderRadius.circular(25)))),
          ],
        ),
      )),
    );
  }
}
