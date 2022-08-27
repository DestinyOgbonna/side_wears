import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/services/firebase.dart';
import 'package:building_ui/services/mysharedpref.dart';

class SettingsViewModel extends StateNotifier<SettingsViewState> {
  SettingsViewModel(this._readServices)
      : super(SettingsViewState(
          userModel: UserModel(),
        ));
  final Reader _readServices;
  final FirestoreCollectionService _firestoreCollectionService =
      FirestoreCollectionService();

  Future getUsername() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get() as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        state = state.copyWith(loadingState: LoadingState.loading);
        final loggedInUsername = UserModel.fromFirestore(getUser);
        state = state.copyWith(
            loadingState: LoadingState.success, userModel: loggedInUsername);
        return loggedInUsername;
      }
    } catch (e) {
      print(e);
      state = state.copyWith(loadingState: LoadingState.error);
    }
  }

  bool? isNewUser;
  void signOutUser(BuildContext context) async {
    _readServices(firebaseProvider).signOutUser;
    await _readServices(prefProvider).setBool('login', false);
    context.router.replaceAll([const SignInPageRoute()]);
  }
}

class SettingsViewState {
  LoadingState loadingState;
  UserModel userModel;
  SettingsViewState({
    this.loadingState = LoadingState.loading,
    required this.userModel,
  });

  SettingsViewState copyWith({
    LoadingState? loadingState,
    UserModel? userModel,
  }) {
    return SettingsViewState(
      loadingState: loadingState ?? this.loadingState,
      userModel: userModel ?? this.userModel,
    );
  }
}
