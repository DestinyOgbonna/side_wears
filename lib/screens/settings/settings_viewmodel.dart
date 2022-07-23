import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/services/firebase.dart';
import 'package:building_ui/services/mysharedpref.dart';

class SettingsViewModel extends StateNotifier<SettingsViewState> {
  SettingsViewModel(this._readServices) : super(SettingsViewState());
  final Reader _readServices;

  bool? isNewUser;
  void signOutUser(BuildContext context) async {
    _readServices(firebaseProvider).signOutUser;
    await _readServices(prefProvider).setBool('login', false);

    context.router.replaceAll([const SignInPageRoute()]);
  }
}

class SettingsViewState {}
