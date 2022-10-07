import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/services/mysharedpref.dart';

class ProfileViewModel extends StateNotifier<ProfileViewState> {
  ProfileViewModel(this._readServices, this._firestoreCollectionService)
      : super(ProfileViewState(
          userModel: UserModel(),
        ));
  final Reader _readServices;
  final FirestoreCollectionService _firestoreCollectionService;

  Future<UserModel?> getUsername() async {
    UserModel? userDetails;
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get() as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        DocumentSnapshot<Map<String, dynamic>> getLoggedInUserName = getUser;
        final loggedInUsername = UserModel.fromFirestore(getLoggedInUserName);
        userDetails= loggedInUsername;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return userDetails;
  }

  bool? isNewUser;
  void signOutUser(BuildContext context) async {
    _readServices(firebaseAuthService).signOutUser;
    await _readServices(prefProvider).setBool('login', false);
    context.router.replaceAll([const SignInPageRoute()]);
  }
}

class ProfileViewState {
  LoadingState loadingState;
  UserModel userModel;
  ProfileViewState({
    this.loadingState = LoadingState.loading,
    required this.userModel,
  });

  ProfileViewState copyWith({
    LoadingState? loadingState,
    UserModel? userModel,
  }) {
    return ProfileViewState(
      loadingState: loadingState ?? this.loadingState,
      userModel: userModel ?? this.userModel,
    );
  }
}
