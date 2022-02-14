import 'dart:async';

import 'package:BusStop/Screens/navBar.dart';
import 'package:BusStop/backends/ccData.dart';
import 'package:BusStop/backends/location.dart';
import 'package:BusStop/backends/pointsData.dart';
import 'package:BusStop/backends/ticketData.dart';
import 'package:BusStop/pages/creditcard.dart';
import 'package:BusStop/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TicketForm extends StatefulWidget {
  const TicketForm({Key key}) : super(key: key);

  @override
  _TicketFormState createState() => _TicketFormState();
}

class _TicketFormState extends State<TicketForm> {
  TextEditingController to = TextEditingController();
  TextEditingController from = TextEditingController();

  List<String> _time = [
    "05:00 AM",
    "07:00 AM",
    "12:00 PM",
    "14:00 PM",
    "17:00 PM"
  ];

  List<String> _payment = ["Credit/debit card", "Points"];

  String _date = DateTime.now().toString().substring(0, 10);
  String secDate = DateTime.now().toString().substring(0, 10);
  String price = '00';
  int _price = 00;
  String _pickedPay = "Credit/debit card";
  String time = '05:00 AM';
  String payType;
  double pointsPrice = (PointsData.points / 5) * 10;
  double points;
  int seats = 60;

  Future<void> _showDialog(String msg, String _title) {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_title),
            content: SingleChildScrollView(
              child: Text(msg),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NavBar()));
                },
              ),
            ],
          );
        });
  }

  Future<void> _showTimeDialog() {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Warning!'),
            content: SingleChildScrollView(
              child: Text('The time you have picked have passed!'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _confirmBuy() async {
    if (_pickedPay == 'Points') {
      if (pointsPrice >= _price / 100) {
        _buyTicket();
        points = ((pointsPrice - (_price / 100)) * 5) / 10;
        PointsData.addPoints(points.toString());
      } else {
        _showDialog('You don`t have enough points: ${pointsPrice.toString()}',
            'Points');
      }
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreditCard()));
      setState(() {
        CCData.price = _price.toDouble();
      });
    }
  }

  void _confirm() async {
    int _time = DateTime.now().hour;
    if (_time >= 18 && _time <= 5 && _date == secDate) {
      _showTimeDialog(); //late at night
    } else if (_time >= 6 &&
        _time <= 7 &&
        time == "05:00 AM" &&
        _date == secDate) {
      _showTimeDialog();
    } else if (_time >= 8 && _time <= 12 && _date == secDate) {
      if (time == "07:00 AM" || time == "05:00 AM") {
        _showTimeDialog();
      } else {
        _confirmBuy();
      }
    } else if (_time >= 13 && _time <= 14 && _date == secDate) {
      if (time == "07:00 AM" || time == "05:00 AM" || time == "12:00 PM") {
        _showTimeDialog();
      } else {
        _confirmBuy();
      }
    } else if (_time >= 15 && _time <= 17 && _date == secDate) {
      if (time == "07:00 AM" ||
          time == "05:00 AM" ||
          time == "12:00 PM" ||
          time == "14:00 PM") {
        _showTimeDialog();
      } else {
        _confirmBuy();
      }
    } else {
      _confirmBuy();
    }
  }

  int _start = 3;
  Timer _timer;
  Future<void> _showProgressDialog() {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              Center(
                child: Container(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Please wait!')
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }

  void _buyTicket() {
    const onSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        onSec,
        (Timer timer) => setState(() {
              if (_start < 1) {
                _showDialog('Your ticket is booked successfully', 'Ticket');
                TicketData.createTicket(
                    from.text, to.text, time, _date, price, payType);
                timer.cancel();
              } else {
                _start = _start - 1;

                _showProgressDialog();
              }
            }));
  }

  @override
  void dispose() {
    super.dispose();
    from.dispose();
    to.dispose();
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    from.text = GetLocation.address;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            W_Header(),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 350,
                    height: 40,
                    margin: EdgeInsets.only(top: 19),
                    child: TextFormField(
                      style: TextStyle(color: const Color(0xffbF4511E)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'To',
                      ),
                      textInputAction: TextInputAction.done,
                      controller: to,
                      obscureText: false,
                      onFieldSubmitted: (to) {
                        if (to.toUpperCase().trim() == "SESHEGO") {
                          setState(() {
                            price = '10.00';
                            _price = 1000;
                          });
                        } else if (to.toUpperCase().trim() == "MAKGOFE") {
                          setState(() {
                            price = '13.00';
                            _price = 1300;
                          });
                        } else if (to.toUpperCase().trim() == "CHEBENG") {
                          setState(() {
                            price = '15.00';
                            _price = 1500;
                          });
                        } else if (to.toUpperCase().trim() == "MANKWENG") {
                          setState(() {
                            price = '21.00';
                            _price = 2100;
                          });
                        } else if (to.toUpperCase().trim() == "BOYNE") {
                          setState(() {
                            price = '26.00';
                            _price = 2600;
                          });
                        } else if (from.text.toUpperCase().trim() ==
                            "SESHEGO") {
                          setState(() {
                            price = '10.00';
                            _price = 1000;
                          });
                        } else if (from.text.toUpperCase().trim() ==
                            "MAKGOFE") {
                          setState(() {
                            price = '13.00';
                            _price = 1300;
                          });
                        } else if (from.text.toUpperCase().trim() ==
                            "CHEBENG") {
                          setState(() {
                            price = '15.00';
                            _price = 1500;
                          });
                        } else if (from.text.toUpperCase().trim() ==
                            "MANKWENG") {
                          setState(() {
                            price = '21.00';
                            _price = 2100;
                          });
                        } else if (from.text.toUpperCase().trim() == "BOYNE") {
                          setState(() {
                            price = '26.00';
                            _price = 2600;
                          });
                        }
                      },
                      /*validator: MultiValidator([
                                EmailValidator(errorText: 'Not a valid email'),
                                RequiredValidator(errorText: 'requred')
                              ]),*/
                    ),
                  ),
                  Container(
                    width: 355,
                    height: 1,
                    color: Color(0xffbF4511E),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 350,
                    height: 40,
                    margin: EdgeInsets.only(top: 19),
                    child: TextFormField(
                      style: TextStyle(color: const Color(0xffbF4511E)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'From',
                      ),
                      textInputAction: TextInputAction.done,
                      controller: from,
                      obscureText: false,
                      /*validator: MultiValidator([
                                EmailValidator(errorText: 'Not a valid email'),
                                RequiredValidator(errorText: 'requred')
                              ]),*/
                    ),
                  ),
                  Container(
                    width: 355,
                    height: 1,
                    color: Color(0xffbF4511E),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: Column(children: [
                  Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ])),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: RadioButtonGroup(
                orientation: GroupedButtonsOrientation.VERTICAL,
                labels: _time,
                activeColor: Color(0xffbF4511E),
                labelStyle: TextStyle(color: Color(0xffbF4511E)),
                onSelected: (String selected) => setState(() {
                  time = selected;
                }),
                picked: time,
                itemBuilder: (Radio rb, Text txt, int i) {
                  return Row(
                    children: [rb, txt],
                  );
                },
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: Column(children: [
                  Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ])),
            Row(children: [
              SizedBox(width: 30),
              Text(_date),
              TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2021, 1, 1),
                      maxTime: DateTime(2030, 1, 1),
                      theme: DatePickerTheme(
                        headerColor: Colors.white,
                        backgroundColor: Colors.white,
                        itemStyle: TextStyle(
                          color: Color(0xffbF4511E),
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                        doneStyle: TextStyle(color: Colors.green),
                      ), onChanged: (date) {
                    setState(() {
                      _date = date.toString().substring(0, 10);
                    });
                    print(date.toString().substring(0, 10));
                  });
                },
                child: Text(
                  'Pick date',
                  style: TextStyle(
                      color: Color(0xffbF4511E),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: Column(children: [
                  Text(
                    'Payments',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ])),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: RadioButtonGroup(
                orientation: GroupedButtonsOrientation.HORIZONTAL,
                labels: _payment,
                activeColor: Color(0xffbF4511E),
                labelStyle: TextStyle(color: Color(0xffbF4511E)),
                onSelected: (String selected) => setState(() {
                  _pickedPay = selected;
                  payType = _pickedPay.toString();
                }),
                picked: _pickedPay,
                itemBuilder: (Radio rb, Text txt, int i) {
                  return Row(
                    children: [rb, txt],
                  );
                },
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: Column(children: [
                  Text(
                    'Price: R$price',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xffbF4511E)),
                  ),
                ])),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  _confirm();
                },
                child: Container(
                    height: 45,
                    width: 190,
                    alignment: Alignment.center,
                    child: Text('Book Now',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                        color: Color(0xffbF4511E),
                        borderRadius: BorderRadius.circular(25)))),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
