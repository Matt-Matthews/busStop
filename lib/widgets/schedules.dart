import 'package:flutter/material.dart';

// ignore: camel_case_types
class W_Schedules extends StatelessWidget {
  const W_Schedules({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 180,
      width: 390,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Monday to Friday'),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                'Schedules',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                'From',
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                'To',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                '1. Seshego',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 32,
              ),
              Text(
                '05:00 AM',
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '18:00 PM',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                '2. Makgofe',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '05:00 AM',
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '18:00 PM',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                '3. Chebeng',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 29,
              ),
              Text(
                '05:00 AM',
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '18:00 PM',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                '4. Mankweng',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                '05:00 AM',
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '18:00 PM',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                '5. Boyne',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 46,
              ),
              Text(
                '05:00 AM',
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(
                width: 29,
              ),
              Text(
                '18:00 PM',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
