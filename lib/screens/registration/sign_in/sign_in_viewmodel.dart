import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/services/firebase.dart';
import 'package:building_ui/core/services/mysharedpref.dart';

class SignInViewModel extends StateNotifier<SignInViewState> {
  SignInViewModel(this._readServices) : super(SignInViewState());

  final Reader _readServices;
  bool? isNewUser;

  obscurePassword() {
    state = state.copyWith(isSelected: !state.isSelected);
  }

  showProgressBar() {
    state = state.copyWith(isProgress: !state.isProgress);
  }

  void saveUserLoginState(BuildContext context) async {
    isNewUser = await _readServices(prefProvider).getBool('login') ?? false;

    if (isNewUser == true) {
      context.router.replaceAll(const [HomeRoute()]);
    }
  }

  Future signUserIntoApp(
      {required String emailController,
      required String passwordController,
      required BuildContext context}) async {
    try {
      if (emailController.isEmpty || passwordController.isEmpty) {
        Fluttertoast.showToast(
            msg: 'Please fill all the fields',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        state = state.copyWith(loadingState: LoadingState.error);
        context.router.push(const SignInPageRoute());
      } else {
        final signUser = _readServices(firebaseProvider)
            .signInWithEmailAndPassword(
                email: emailController.trim(),
                password: passwordController.trim())
            .then((value) async {
          Future.delayed(const Duration(seconds: 10));
          Fluttertoast.showToast(
              msg: "Login Successful",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          state = state.copyWith(
            loadingState: LoadingState.success,
          );
          await _readServices(prefProvider).setBool('login', true);
          context.router.replaceAll([const HomeRoute()]);
        }).catchError((err) {
          Fluttertoast.showToast(
              msg: err.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          state = state.copyWith(loadingState: LoadingState.error);
          context.router.pop();
        });
        return signUser;
      }
    } on FirebaseException catch (e) {
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
    }
  }
}

class SignInViewState {
  LoadingState loadingState;
  bool isSelected;
  bool isProgress;
  SignInViewState(
      {this.loadingState = LoadingState.loading,
      this.isSelected = true,
      this.isProgress = false});

  SignInViewState copyWith({
    LoadingState? loadingState,
    bool? isSelected,
    bool? isProgress,
  }) {
    return SignInViewState(
      loadingState: loadingState ?? this.loadingState,
      isSelected: isSelected ?? this.isSelected,
      isProgress: isProgress ?? this.isProgress,
    );
  }
}
