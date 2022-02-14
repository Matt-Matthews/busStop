import 'package:BusStop/Screens/login.dart';
import 'package:BusStop/backends/user.dart';
import 'package:flutter/material.dart';
import 'package:BusStop/pages/home.dart';
import 'package:BusStop/pages/ticketList.dart';
import 'package:BusStop/pages/busStops.dart';
import 'package:BusStop/pages/account.dart';
import 'package:BusStop/pages/settings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _index = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    BusStops(),
    TicketList(),
    Account(),
    Settings()
  ];
  Future<bool> onBackButton() {
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
                          builder: (BuildContext context) => LoginPage()),
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
    void onTappedBar(int index) {
      setState(() {
        _index = index;
      });
    }

    return WillPopScope(
        onWillPop: onBackButton,
        child: Scaffold(
            body: _pages[_index],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.directions_bus), label: 'BusStops'),
                BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.ticketAlt, size: 20),
                    label: 'Tickets'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Account'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: 'Settings')
              ],
              onTap: onTappedBar,
              currentIndex: _index,
              elevation: 0.0,
              iconSize: 25.0,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              backgroundColor: Color(0xffbF4511E),
              unselectedIconTheme: IconThemeData(color: Colors.black87),
              selectedIconTheme: IconThemeData(color: Color(0xffbF4511E)),
            )));
  }
}
