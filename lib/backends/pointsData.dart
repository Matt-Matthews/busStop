import 'package:cloud_firestore/cloud_firestore.dart';

class PointsData {
  static double points = 0;
  static String pointString;
  static String _id;
  static void createPoints(String id) async {
    await Firestore.instance
        .collection('points')
        .document(id)
        .setData({"point": "2.0"});
  }

  static void getPoints(String id) async {
    Firestore.instance
        .collection('points')
        .document(id)
        .snapshots()
        .listen((snapshot) {
      pointString = snapshot.data['point'];
      _id = id;
      points = double.parse(pointString);
    });
  }

  static void addPoints(String points) async {
    await Firestore.instance
        .collection('points')
        .document(_id)
        .setData({"point": points});
  }
}
