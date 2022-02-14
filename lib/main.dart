import 'package:flutter/material.dart';
import 'package:BusStop/screens/startUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
