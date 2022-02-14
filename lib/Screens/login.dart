import 'dart:async';

import 'package:BusStop/backends/pointsData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:BusStop/Screens/navBar.dart';
import 'package:BusStop/Screens/register.dart';
//import 'package:BusStop/backends/location.dart';
import 'package:BusStop/backends/ticketData.dart';
import 'package:BusStop/backends/user.dart';
import 'package:BusStop/pages/resetPassword.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String errorMsg = '';
  int _start = 2;
  Timer _timer;
  Future<void> _showDialog() {
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

  Future<void> validate() async {
    if (formKey.currentState.validate()) {
      try {
        AuthResult authResult = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        const onSec = const Duration(seconds: 1);
        _showDialog();
        if (authResult != null) {
          FirebaseUser user = authResult.user;
          setState(() {
            User.id = user.uid;
          });

          Map userData;
          await Firestore.instance
              .collection('user')
              .document(user.uid)
              .get()
              .then((snapshot) {
            userData = snapshot.data;
            User.firstname = userData['firstname'];
            User.lastname = userData['lastname'];
            User.contact = userData['contact'];
            User.email = userData['email'];
            print(User.firstname);
          });
          PointsData.getPoints(user.uid);
          _timer = new Timer.periodic(
              onSec,
              (Timer timer) => setState(() {
                    if (_start < 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NavBar()));
                      timer.cancel();
                    } else {
                      _start = _start - 1;
                    }
                  }));

          // User.login(
          //mail.text.toString().trim(), password.text.toString().trim());

          TicketData.totalTickets();
          // TicketData.busTicketStatus();

        } else {
          setState(() {
            errorMsg = 'Check internet connection!ping ';
          });
          _showDialog();
        }
      } on PlatformException catch (error) {
        print(error.message);
        setState(() {
          errorMsg = error.message.toString();
        });
      }
    } else {
      print('not validated');
    }
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
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
              Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffbF4511E)),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
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
                                hintText: 'Email',
                              ),
                              textInputAction: TextInputAction.next,
                              controller: email,
                              validator: MultiValidator([
                                EmailValidator(errorText: 'Not a valid email'),
                                RequiredValidator(errorText: 'requred')
                              ]),
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
                      child: Column(
                        children: [
                          Container(
                            width: 350,
                            height: 40,
                            margin: EdgeInsets.only(top: 19),
                            child: TextFormField(
                                style:
                                    TextStyle(color: const Color(0xffbF4511E)),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'Password',
                                ),
                                textInputAction: TextInputAction.done,
                                controller: password,
                                obscureText: true,
                                validator: MultiValidator([
                                  RequiredValidator(errorText: 'requred'),
                                  MinLengthValidator(4,
                                      errorText:
                                          'should be atleast 4 characters')
                                ])),
                          ),
                          Container(
                            width: 355,
                            height: 1,
                            color: Color(0xffbF4511E),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(errorMsg,
                    style: TextStyle(color: const Color(0xffbF4511E))),
              ),
              SizedBox(
                height: 70,
              ),
              GestureDetector(
                  onTap: validate,
                  child: Container(
                      height: 45,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text('Sign in',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          color: Color(0xffbF4511E),
                          borderRadius: BorderRadius.circular(25)))),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword()));
                  },
                  child: Container(
                    child: Text('Forgot password?',
                        style: TextStyle(color: const Color(0xffbF4511E))),
                  )),
              SizedBox(height: 30),

              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Container(
                    child: Text('Don`t have an account?',
                        style: TextStyle(color: const Color(0xffbF4511E))),
                  ))
            ],
          ),
        )));
  }
}
