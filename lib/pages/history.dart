import 'package:BusStop/widgets/header.dart';
//import 'package:BusStop/widgets/ticketCard.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              W_Headers(),
              //TicketCard(),
            ],
          ),
        ),
      ),
    );
  }
}
