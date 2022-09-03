import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/services/mysharedpref.dart';

import '../../../services/firebase.dart';

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

  Future signUserIntoApp(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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
              email: emailController.text.trim(),
              password: passwordController.text.trim())
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
