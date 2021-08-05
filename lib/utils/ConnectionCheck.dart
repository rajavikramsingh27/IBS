import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class ConnectionCheck {
  final Connectivity _connectivity = Connectivity();

  Future<bool> initConnectivity() async {
    ConnectivityResult? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return await _updateConnectionStatus(result);
  }

  Future<bool> _updateConnectionStatus(ConnectivityResult? result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        return true;
        break;
      case ConnectivityResult.mobile:
        return true;
        break;
      case ConnectivityResult.none:
        return false;
        break;
      default:
        return false;
        break;
    }
  }
}
