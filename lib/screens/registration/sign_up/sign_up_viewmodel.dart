import 'package:building_ui/core/exports/exports.dart';

class SignUpViewModel extends StateNotifier<SignUpViewState> {
  SignUpViewModel(this._readServices)
      : super(SignUpViewState(userModel: UserModel()));

  final Reader _readServices;

  obscurePassword() {
    state = state.copyWith(isSelected: !state.isSelected);
  }

  showProgressBar() {
    state = state.copyWith(isProgress: !state.isProgress);
  }

  Future signUpUser({
    required String emailController,
    required String passwordController,
    required String nameController,
    required String userNameController,
    required BuildContext context,
  }) async {
    if (emailController.isEmpty ||
        passwordController.isEmpty ||
        userNameController.isEmpty ||
        passwordController.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please fill all the fields',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      state = state.copyWith(loadingState: LoadingState.error);
      context.router.pop();
    } else {
      try {
        final signUpUser = _readServices(firebaseAuthService)
            .createNewUser(
                email: emailController.toString().trim(),
                password: passwordController.toString().trim())
            .then((value) {
          Fluttertoast.showToast(
              msg: "Sign Up Successful",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          addUserData(emailController, nameController, userNameController);
          context.router.replaceAll(
            const [
              SignInPageRoute(),
            ],
          );
          state = state.copyWith(loadingState: LoadingState.success);
        }).catchError((err) {
          Fluttertoast.showToast(
              msg: err.code,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          state = state.copyWith(loadingState: LoadingState.error);
        });
        return signUpUser;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'auth/wrong-password') {
          Fluttertoast.showToast(
              msg: 'Password is not correct',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (e.code == 'auth/user-not-found') {
          Fluttertoast.showToast(
              msg: 'User not found',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (e.code == 'auth/invalid-email') {
          Fluttertoast.showToast(
              msg: 'Invalid Email address',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        state = state.copyWith(loadingState: LoadingState.error);
      } on SocketException {
        Fluttertoast.showToast(
            msg: 'Please check your internet connection',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        state = state.copyWith(loadingState: LoadingState.error);
      }
    }
  }

  Future addUserData(String? emailController, String? nameController,
      String? userNameController) async {
    try {
      final userModel = UserModel(
        name: nameController.toString().trim(),
        email: emailController.toString().trim(),
        username: userNameController.toString().trim(),
      );
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await docRef.set(
        userModel.toFirestore(),
      );
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(
          msg: '${e.message}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      state = state.copyWith(loadingState: LoadingState.error);
    }
  }
}

class SignUpViewState {
  LoadingState loadingState;
  UserModel? userModel;
  bool isSelected;
  bool isProgress;
  SignUpViewState(
      {this.loadingState = LoadingState.loading,
      this.userModel,
      this.isProgress = false,
      this.isSelected = true});

  SignUpViewState copyWith({
    LoadingState? loadingState,
    UserModel? userModel,
    bool? isSelected,
    bool? isProgress,
  }) {
    return SignUpViewState(
      isSelected: isSelected ?? this.isSelected,
      loadingState: loadingState ?? this.loadingState,
      userModel: userModel ?? userModel,
      isProgress: isProgress ?? this.isProgress,
    );
  }
}
