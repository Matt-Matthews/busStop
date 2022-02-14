import 'package:flutter/material.dart';

// ignore: camel_case_types
class W_Pricing extends StatelessWidget {
  const W_Pricing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 180,
      width: 190,
      child: Column(
        children: [
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            child: Text('Price List'),
          ),
          Row(children: [
            SizedBox(width: 5),
            Text(
              'Location',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 58,
            ),
            Text(
              'Price',
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
          ]),
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
                width: 42,
              ),
              Text(
                'R10.00',
                style: TextStyle(color: Colors.blueAccent),
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
                width: 41,
              ),
              Text(
                'R13.00',
                style: TextStyle(color: Colors.blueAccent),
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
                width: 40,
              ),
              Text(
                'R15.00',
                style: TextStyle(color: Colors.blueAccent),
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
                width: 26,
              ),
              Text(
                'R21.00',
                style: TextStyle(color: Colors.blueAccent),
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
                width: 57,
              ),
              Text(
                'R26.00',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
