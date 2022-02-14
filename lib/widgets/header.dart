import 'package:BusStop/Screens/startUp.dart';
import 'package:BusStop/backends/user.dart';
import 'package:BusStop/pages/ticketForm.dart';
import 'package:BusStop/widgets/popup.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class W_HomeHeader extends StatelessWidget {
  const W_HomeHeader({Key key}) : super(key: key);
  Future<bool> onSignOut(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: SingleChildScrollView(
              child: Text('Do you want to logout?'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => StartUp()),
                      ModalRoute.withName("/"));
                  User.signOut();
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(width: 45),
          Container(
            height: 60,
            width: 60,
            child: Image(image: AssetImage('lib/assets/bus-logo.png')),
          ),
          SizedBox(width: 250),
          PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Color(0xffbF4511E)),
              onSelected: (String choice) {
                if (choice == 'Sign out') {
                  onSignOut(context);
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Sign out'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: TextStyle(color: Color(0xffbF4511E)),
                    ),
                  );
                }).toList();
              }),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class W_Header extends StatelessWidget {
  const W_Header({Key key}) : super(key: key);
  Future<bool> onSignOut(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: SingleChildScrollView(
              child: Text('Do you want to logout?'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => StartUp()),
                      ModalRoute.withName("/"));
                  User.signOut();
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            child: GestureDetector(
              child: Icon(Icons.arrow_back_ios, color: Color(0xffbF4511E)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 60,
            width: 60,
            child: Image(image: AssetImage('lib/assets/bus-logo.png')),
          ),
          SizedBox(width: 250),
          PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Color(0xffbF4511E)),
              onSelected: (String choice) {
                if (choice == 'Pricing') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUp(),
                  );
                } else if (choice == 'Schedule') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUp2(),
                  );
                } else if (choice == 'Sign out') {
                  onSignOut(context);
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Schedule', 'Pricing', 'Sign out'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: TextStyle(color: Color(0xffbF4511E)),
                    ),
                  );
                }).toList();
              }),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class W_Headers extends StatelessWidget {
  const W_Headers({Key key}) : super(key: key);
  Future<bool> onSignOut(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: SingleChildScrollView(
              child: Text('Do you want to logout?'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => StartUp()),
                      ModalRoute.withName("/"));
                  User.signOut();
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(width: 45),
          Container(
            height: 60,
            width: 60,
            child: Image(image: AssetImage('lib/assets/bus-logo.png')),
          ),
          SizedBox(width: 250),
          PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Color(0xffbF4511E)),
              onSelected: (String choice) {
                if (choice == 'Pricing') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUp(),
                  );
                } else if (choice == 'Schedule') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUp2(),
                  );
                } else if (choice == 'Sign out') {
                  onSignOut(context);
                } else if (choice == 'Book a Ticket') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TicketForm()));
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Schedule', 'Pricing', 'Book a Ticket', 'Sign out'}
                    .map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: TextStyle(color: Color(0xffbF4511E)),
                    ),
                  );
                }).toList();
              }),
        ],
      ),
    );
  }
}
