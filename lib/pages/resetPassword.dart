import 'package:BusStop/Screens/login.dart';
import 'package:BusStop/backends/user.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String errMsg = '';
  Future<bool> onPasswordReset() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Password reset'),
            content: SingleChildScrollView(
              child: Text('Check the email sent to you.'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  User.passwordReset(email.text.toString());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()),
                      ModalRoute.withName("/"));
                },
              ),
            ],
          );
        });
  }

  void validate() {
    if (formKey.currentState.validate()) {
      onPasswordReset();
    } else {
      print('not validated');
    }
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      child: GestureDetector(
                        child: Icon(Icons.arrow_back_ios,
                            color: Color(0xffbF4511E)),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 60,
                      width: 60,
                      child:
                          Image(image: AssetImage('lib/assets/bus-logo.png')),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200),
              Text(
                'Enter your email to reset password.',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: formKey,
                child: Container(
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
                          textInputAction: TextInputAction.done,
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
              ),
              SizedBox(height: 30),
              GestureDetector(
                  onTap: validate,
                  child: Container(
                      height: 45,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text('Reset',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          color: Color(0xffbF4511E),
                          borderRadius: BorderRadius.circular(25)))),
              SizedBox(height: 20),
              Text(
                User.emailError,
                style: TextStyle(color: Color(0xffbF4511E)),
              )
            ]),
          ),
        ));
  }
}
