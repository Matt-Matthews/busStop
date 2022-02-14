import 'package:BusStop/backends/ticketData.dart';
import 'package:BusStop/pages/ticketList.dart';
import 'package:flutter/material.dart';
import 'package:BusStop/widgets/header.dart';
import 'package:BusStop/widgets/ticketWidget.dart';

class Ticket extends StatelessWidget {
  final String ticketNo;
  final String to;
  final String from;
  final String date;
  final String time;
  final String price;
  final String status;
  final String id;
  Ticket(this.ticketNo, this.to, this.from, this.date, this.time, this.price,
      this.status, this.id);

  @override
  Widget build(BuildContext context) {
    Future<void> _showDeleteDialog() {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Cancel'),
              content: SingleChildScrollView(
                child: Text('Do you want to Cancel the ticket?'),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => TicketList()),
                        ModalRoute.withName("/"));
                    TicketData.cancelTicked(id);
                  },
                ),
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          W_Header(),
          W_Ticket(ticketNo, to, from, date, time, price, status),
          SizedBox(height: 100),
          GestureDetector(
              onTap: () {
                _showDeleteDialog();
              },
              child: Container(
                  height: 45,
                  width: 190,
                  alignment: Alignment.center,
                  child: Text('Cancel',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  decoration: BoxDecoration(
                      color: Color(0xffbF4511E),
                      borderRadius: BorderRadius.circular(25)))),
        ],
      )),
    );
  }
}
