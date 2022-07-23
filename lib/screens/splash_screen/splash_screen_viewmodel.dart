
import 'package:building_ui/exports/exports.dart';

class SplashScreenViewModel extends StateNotifier<SplashScreenState> {
  SplashScreenViewModel() : super(SplashScreenState());

  checkInternetConnection() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    switch (result) {
      case ConnectivityResult.mobile:
        Fluttertoast.showToast(
            msg: 'Connected',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
      case ConnectivityResult.bluetooth:
        Fluttertoast.showToast(
            msg: 'Connected to bluetooth',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
      case ConnectivityResult.wifi:
        Fluttertoast.showToast(
            msg: 'Connected to wifi',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
      case ConnectivityResult.ethernet:
        Fluttertoast.showToast(
            msg: 'Connected to ethernet',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
      case ConnectivityResult.none:
        Fluttertoast.showToast(
            msg: 'No internet Connection pls check network',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
    }
  }
}

class SplashScreenState {}
