import 'package:BusStop/backends/pointsData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CCData {
  static double price;

  static void getCCData(
      String ccNum, String cvv, String expDate, String holder) async {
    Map<String, dynamic> ccData = {
      "ccNum": ccNum,
      "cvv": cvv,
      "expDate": expDate,
      "holder": holder
    };
    await Firestore.instance.collection('creditcard').add(ccData);
    double points = PointsData.points + (((CCData.price / 100) * 5) / 100);
    PointsData.addPoints(points.toString());
  }
}
