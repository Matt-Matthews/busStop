//import 'package:connectivity/connectivity.dart';
import 'dart:io';

class Connectivity {
  static void checkConnection() async {
    /*var connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
  // I am  not connected to a network.
} 
  }*/

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }
}
