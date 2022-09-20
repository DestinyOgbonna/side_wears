import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/services/firebase.dart';
import 'package:building_ui/core/services/mysharedpref.dart';

class SettingsViewModel extends StateNotifier<SettingsViewState> {
  SettingsViewModel(this._readServices, this._firestoreCollectionService)
      : super(SettingsViewState(
          userModel: UserModel(),
        ));
  final Reader _readServices;
  final FirestoreCollectionService _firestoreCollectionService;

  Future<UserModel?> getUsername() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get() as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        DocumentSnapshot<Map<String, dynamic>> getLoggedInUserName = getUser;
        final loggedInUsername = UserModel.fromFirestore(getLoggedInUserName);
        return loggedInUsername;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return null;
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
