import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user.dart';

class TicketData {
  static int total;
  static void totalTickets() {
    Firestore.instance
        .collection('ticket')
        .where('id', isEqualTo: User.id)
        .snapshots()
        .listen((snapshot) {
      total = snapshot.documents.length;
    });
  }

  static void cancelTicked(String id) async {
    await Firestore.instance
        .collection('ticket')
        .document(id)
        .updateData({"status": "Cancelled"});
  }

  static void createTicket(String from, String to, String time, String date,
      String price, String payType) {
    Random random = new Random();
    int ticketNo = random.nextInt(1000);
    var timeStamp = Timestamp.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch);
    Map<String, dynamic> ticketData = {
      "id": User.id,
      "from": from,
      "to": to,
      "time": time,
      "date": date,
      "status": "Paid",
      "price": "R" + price,
      "ticketNo": ticketNo.toString(),
      "createdAt": timeStamp,
      "search": "all"
    };
    Map<String, dynamic> paymentData = {
      "ticketNo": ticketNo.toString(),
      "PayType": payType,
      "price": "R" + price,
      "id": User.id
    };
    CollectionReference colRef = Firestore.instance.collection('ticket');
    colRef.add(ticketData).then((value) {
      Firestore.instance.collection('payment').add(paymentData);
    });
  }

  static void busTicketStatus(String id) async {}

  static void expired(String id) async {
    await Firestore.instance
        .collection('ticket')
        .document(id)
        .setData({"status": "Expired"});
  }
}
