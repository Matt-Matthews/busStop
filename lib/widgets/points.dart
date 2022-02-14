import 'package:flutter/material.dart';

// ignore: camel_case_types
class W_Points extends StatelessWidget {
  const W_Points({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
      height: 180,
      width: 190,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Loyality Points'),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Get 0.05 Points \non every R1.00 \nyou spent',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Text(
            'Learn more',
            style: TextStyle(color: Color(0xffbF4511E)),
          )
        ],
      ),
    );
  }
}
