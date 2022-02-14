import 'package:BusStop/Screens/startUp.dart';
import 'package:BusStop/backends/user.dart';
import 'package:BusStop/pages/ticket.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TicketList extends StatefulWidget {
  const TicketList({Key key}) : super(key: key);

  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  String status = 'all';
  String field = 'search';
  Future<void> _showDeleteDialog(String id) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Remove'),
            content: SingleChildScrollView(
              child: Text('Do you want to Remove the ticket?'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Firestore.instance.collection('ticket').document(id).delete();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 45),
                    Container(
                      height: 60,
                      width: 60,
                      child:
                          Image(image: AssetImage('lib/assets/bus-logo.png')),
                    ),
                    SizedBox(width: 250),
                    PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert, color: Color(0xffbF4511E)),
                        onSelected: (String choice) {
                          if (choice == 'All') {
                            setState(() {
                              status = 'all';
                              field = 'search';
                            });
                          } else if (choice == 'Paid') {
                            setState(() {
                              status = 'Paid';
                              field = 'status';
                            });
                          } else if (choice == 'Sign out') {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        StartUp()),
                                ModalRoute.withName("/"));
                            User.signOut();
                          } else if (choice == 'Cancelled') {
                            setState(() {
                              status = 'Cancelled';
                              field = 'status';
                            });
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return {'All', 'Paid', 'Cancelled', 'Sign out'}
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
              ),
              Container(
                height: 690,
                width: 385,
                padding: EdgeInsets.only(left: 5),
                child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('ticket')
                        .where('id', isEqualTo: User.id)
                        .where(field, isEqualTo: status)
                        .orderBy('createdAt', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null)
                        return CircularProgressIndicator();

                      final List<DocumentSnapshot> docs =
                          snapshot.data.documents;

                      return ListView(
                          children: docs
                              .map((doc) => Card(
                                    child: ListTile(
                                      title: Text(
                                        'Ticket No. #' + doc['ticketNo'],
                                        style: TextStyle(
                                            color: Color(0xffbF4511E),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text('Date :' +
                                          doc['date'] +
                                          '\nTime: ' +
                                          doc['time'] +
                                          '\nTo: ' +
                                          doc['to'] +
                                          '\n' +
                                          doc['status']),
                                      onLongPress: () {
                                        if (doc['status'] == 'Cancelled') {
                                          _showDeleteDialog(
                                              doc.documentID.toString());
                                        }
                                      },
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Ticket(
                                                      doc['ticketNo'],
                                                      doc['to'],
                                                      doc['from'],
                                                      doc['date'],
                                                      doc['time'],
                                                      doc['price'],
                                                      doc['status'],
                                                      doc.documentID.toString(),
                                                    )));
                                      },
                                    ),
                                  ))
                              .toList());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
