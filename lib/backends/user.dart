import 'package:BusStop/backends/pointsData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class User {
  static bool isDone = false;
  static String firstname = '..';
  static String lastname = '..';
  static String contact;
  static String email;
  static String errorMsg = '';
  static String id;
  static String points = '..';
  static bool isValid = false;
  static String emailError = '';

  static void createUser(String firstname, String lastname, String contact,
      String email, String password) async {
    try {
      AuthResult authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((e) {
        errorMsg = 'user account exist!';
      });
      FirebaseUser user = authResult.user;
      CollectionReference col = Firestore.instance.collection('user');
      String id = user.uid;
      Map<String, dynamic> regData = {
        "firstname": firstname,
        "lastname": lastname,
        "contact": contact,
        "email": email,
        "id": id.toString()
      };
      col.document(id).setData(regData);
      PointsData.createPoints(id);
    } on PlatformException catch (e) {
      print(e.message.toString());
      errorMsg = e.message;
    }
  } //createUser

  static void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static void passwordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on PlatformException catch (e) {
      print(e.message);
      emailError = e.message;
    }
  }

  static void login(String _email, String password) async {
    Map userData;
    try {
      AuthResult authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: password)
          .catchError((e) {
        errorMsg = 'Wrong password or account doesn`t exist!';
        isDone = false;
        isValid = false;
      });

      if (authResult != null) {
        FirebaseUser user = authResult.user;
        //id = user.uid;
        await Firestore.instance
            .collection('user')
            .document(user.uid)
            .get()
            .then((snapshot) {
          userData = snapshot.data;
          firstname = userData['firstname'];
          lastname = userData['lastname'];
          contact = userData['contact'];
          email = userData['email'];
          id = userData['id'];
          print('user id = $id');
          print(firstname);
        });
        isDone = true;
        isValid = true;
        PointsData.getPoints(user.uid);
      } else {
        isDone = false;
        isValid = false;
      }
    } on AuthException catch (e) {
      print(e.hashCode.toString());
      errorMsg = 'user account exist!';
      isValid = false;
    } catch (e) {
      print(e.hashCode.toString());
    }
  }
}
