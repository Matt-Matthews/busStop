import 'package:flutter/material.dart';

// ignore: camel_case_types
class W_HeadNav extends StatelessWidget {
  final String _name;
  final IconData _icon;
  //final int _index;
  W_HeadNav(this._name, this._icon);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 130,
        width: 90,
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
        child: GestureDetector(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Icon(
                _icon,
                color: Color(0xffbF4511E),
                size: 25,
              ),
              SizedBox(height: 10),
              Text(
                _name,
                style: TextStyle(
                    color: Color(0xffbF4511E), fontWeight: FontWeight.bold),
              ),
            ],
          ),
          onTap: () {
            //Navigation.index(_index);
            /* Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()));*/
          },
        ));
  }
}
