import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

// ignore: camel_case_types
class W_Ticket extends StatelessWidget {
  final String ticketNo;
  final String to;
  final String from;
  final String date;
  final String time;
  final String price;
  final String status;
  W_Ticket(this.ticketNo, this.to, this.from, this.date, this.time, this.price,
      this.status);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(40.0, 10.0),
            child: Container(
              height: 600,
              width: 320,
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Color(0xffbF4511E),
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(right: 49),
                      child: Text(
                        'Ticket No. #' + ticketNo,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  SizedBox(height: 30),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              'From',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            ': ' + from,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      )),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Container(
                              width: 120,
                              child: Text(
                                'To',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              )),
                          Text(
                            ': ' + to,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      )),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Container(
                              width: 120,
                              child: Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              )),
                          Text(
                            ': ' + date,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      )),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              'Time',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            ': ' + time,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      )),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            ': ' + price,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      )),
                  SizedBox(height: 100),
                  Container(
                      //barcode
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.only(right: 25),
                      child: BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: status,
                      ))
                ],
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(20.0, 360.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          Transform.translate(
              offset: Offset(340.0, 360.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
        ],
      ),
    );
  }
}
