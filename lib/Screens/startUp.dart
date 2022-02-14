import 'package:BusStop/Screens/login.dart';
import 'package:BusStop/Screens/register.dart';
import 'package:BusStop/backends/connactivity.dart';
import 'package:BusStop/backends/location.dart';
import 'package:flutter/material.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUp createState() => _StartUp();
}

class _StartUp extends State<StartUp> {
  @override
  Widget build(BuildContext context) {
    Color _color1 = Color(0xffbF4511E);
    Color _color2 = Colors.white;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                  //color: Colors.blue,
                  //padding: EdgeInsets.only(left: 90),
                  width: 500,
                  child: Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage('lib/assets/bus-logo.png')),
                  )), //Logo
              SizedBox(
                height: 10,
              ),
              Container(
                //padding: EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffbF4511E)),
                    ),
                    Text(
                      'Bus-Stop',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffbF4511E)),
                    ),
                  ],
                ),
              ), //Welcome texts
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () {
                    Connectivity.checkConnection();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    GetLocation.locatePosition();
                  },
                  child: Container(
                      height: 45,
                      width: 350,
                      alignment: Alignment.center,
                      child: Text('Sign in',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          color: _color1,
                          border: Border.all(color: Color(0xffbF4511E)),
                          borderRadius:
                              BorderRadius.circular(25)))), //sign in button
              SizedBox(
                height: 35,
              ),

              GestureDetector(
                  onTap: () {
                    Connectivity.checkConnection();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                    GetLocation.locatePosition();
                  },
                  child: Container(
                      height: 45,
                      width: 350,
                      alignment: Alignment.center,
                      child: Text('Sign up',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffbF4511E),
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          color: _color2,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: Color(0xffbF4511E))))), //sign up button
              SizedBox(
                height: 35,
              ),
              /*Text('Sign in with:',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffbF4511E),
                      fontWeight: FontWeight.normal)),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 35),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    GestureDetector(
                        child: Container(
                            height: 45,
                            width: 170,
                            child: Row(
                              children: [
                                SizedBox(width: 5),
                                FaIcon(FontAwesomeIcons.google,
                                    size: 35, color: Color(0xffbF4511E)),
                                SizedBox(width: 25),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text('Google',
                                      style: TextStyle(
                                        color: Color(0xffbF4511E),
                                      )),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: _color2,
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: Color(0xffbF4511E))))),
                    SizedBox(width: 10),
                    GestureDetector(
                        child: Container(
                            height: 45,
                            width: 170,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                FaIcon(FontAwesomeIcons.facebookF,
                                    size: 35, color: Color(0xffbF4511E)),
                                SizedBox(width: 25),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text('Facebook',
                                      style: TextStyle(
                                        color: Color(0xffbF4511E),
                                      )),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: _color2,
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: Color(0xffbF4511E))))),
                    /*IconButton(
                        onPressed: null,
                        icon: FaIcon(FontAwesomeIcons.google,
                            size: 45, color: Color(0xffbF4511E))),
                    SizedBox(width: 90),
                    IconButton(
                        onPressed: null,
                        icon: FaIcon(FontAwesomeIcons.facebookSquare,
                            size: 45, color: Color(0xffbF4511E))),
                    SizedBox(width: 90),
                    IconButton(
                        onPressed: null,
                        icon: FaIcon(FontAwesomeIcons.twitterSquare,
                            size: 45, color: Color(0xffbF4511E))),*/
                  ],
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
