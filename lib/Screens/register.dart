import 'package:BusStop/Screens/login.dart';
import 'package:BusStop/backends/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validate() {
    if (formKey.currentState.validate()) {
      if (password.text.toString().trim() ==
          confPassword.text.toString().trim()) {
        User.createUser(
            firstname.text.toString().trim(),
            lastname.text.toString().trim(),
            contact.text.toString().trim(),
            email.text.toString().trim(),
            password.text.toString().trim());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } else {
      print('not validated');
    }
  }

  @override
  void dispose() {
    super.dispose();
    firstname.dispose();
    lastname.dispose();
    contact.dispose();
    email.dispose();
    password.dispose();
    confPassword.dispose();
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
                'Sign up',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffbF4511E)),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                  key: formKey,
                  child: Column(children: [
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
                                hintText: 'Firstname',
                              ),
                              textInputAction: TextInputAction.next,
                              controller: firstname,
                              validator:
                                  RequiredValidator(errorText: 'requred'),
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
                                hintText: 'Lastname',
                              ),
                              textInputAction: TextInputAction.next,
                              controller: lastname,
                              validator:
                                  RequiredValidator(errorText: 'requred'),
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
                                hintText: 'Email',
                              ),
                              textInputAction: TextInputAction.next,
                              controller: email,
                              //obscureText: _isObscured,
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
                                hintText: 'Contact',
                              ),
                              textInputAction: TextInputAction.next,
                              controller: contact,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'requred'),
                                MinLengthValidator(10,
                                    errorText: 'invalid contact number'),
                                MaxLengthValidator(10,
                                    errorText: 'invalid contact number'),
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
                                hintText: 'New password',
                              ),
                              textInputAction: TextInputAction.next,
                              controller: password,
                              obscureText: true,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'requred'),
                                MinLengthValidator(4,
                                    errorText: 'should be atleast 4 characters')
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
                                hintText: 'Confirm password',
                              ),
                              textInputAction: TextInputAction.done,
                              controller: confPassword,
                              obscureText: true,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'requred'),
                                MinLengthValidator(4,
                                    errorText: 'should be atleast 4 characters')
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
                  ])),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(User.errorMsg,
                    style: TextStyle(color: const Color(0xffbF4511E))),
              ),
              SizedBox(
                height: 10,
              ),

              GestureDetector(
                  onTap: validate,
                  child: Container(
                      height: 45,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text('Sign up',
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                    child: Text('Already have an account?',
                        style: TextStyle(color: const Color(0xffbF4511E))),
                  ))
            ],
          ),
        )));
  }
}
