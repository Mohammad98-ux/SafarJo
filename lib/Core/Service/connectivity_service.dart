import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService{
  static String getConnectionValue(var connectivityResult) {
    String status = '';
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        status = 'Mobile';
        break;
      case ConnectivityResult.wifi:
        status = 'Wi-Fi';
        break;
      case ConnectivityResult.none:
        status = 'None';
        break;
      default:
        status = 'None';
        break;
    }
    return status;
  }

  static Future<bool> checkInternetConnectivity() async {
    final Connectivity _connectivity = Connectivity();
    ConnectivityResult result = await _connectivity.checkConnectivity();
    String connection = getConnectionValue(result);
    // ignore: unnecessary_null_comparison
    if (connection == null) {
      return false;
    } else {
      return true;
    }
  }

}