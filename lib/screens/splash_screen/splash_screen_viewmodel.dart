import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/services/mysharedpref.dart';

class SplashScreenViewModel extends StateNotifier<SplashScreenState> {
  SplashScreenViewModel(this._readServices) : super(SplashScreenState());

  final Reader _readServices;
  bool? isNewUser;

  checkInternetConnection(BuildContext context) async {
    final connectionType = await Connectivity().checkConnectivity();
    switch (connectionType) {
      case ConnectivityResult.mobile:
        Fluttertoast.showToast(
            msg: 'Connected to mobile',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        break;
      case ConnectivityResult.bluetooth:
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
        break;
      case ConnectivityResult.none:
       context.router.pop();
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

  void saveUserLoginState(BuildContext context) async {
    isNewUser = await _readServices(prefProvider).getBool('login') ?? false;

    if (isNewUser == true) {
      await Future.delayed(const Duration(seconds: 5));
      context.router.replaceAll(const [HomeRoute()]);
    } else if (isNewUser == false) {
      context.router.replaceAll(const [SignInPageRoute()]);
    }
  }
}

class SplashScreenState {}
