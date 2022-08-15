import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/services/firebase.dart';

class SignUpViewModel extends StateNotifier<SignUpViewState> {
  SignUpViewModel(this._readServices) : super(SignUpViewState(userModel: UserModel()));

  final Reader _readServices;
  Future signUpUser(
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController nameController,
      TextEditingController userNameController,
      BuildContext context) async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        userNameController.text.isEmpty ||
        passwordController.text.isEmpty) {
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
        final signUpUser = _readServices(firebaseProvider)
          .createNewUser(
                  email: emailController.text.toString().trim(),
                  password: passwordController.text.toString().trim())
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

            context.router.replaceAll(const [SignInPageRoute()]);
            state = state.copyWith(loadingState: LoadingState.success);
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
          });
        return signUpUser;
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
            msg: '${e.message}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
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

  Future addUserData(
      TextEditingController emailController,
      TextEditingController nameController,
      TextEditingController userNameController) async {
    try {
      final userModel = UserModel(
        name: nameController.text.toString().trim(),
        email: emailController.text.toString().trim(),
        username: userNameController.text.toString().trim(),
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

  SignUpViewState({this.loadingState = LoadingState.loading, this.userModel});

  SignUpViewState copyWith({
    LoadingState? loadingState,
  }) {
    return SignUpViewState(
        loadingState: loadingState ?? this.loadingState,
        userModel: userModel ?? userModel);
  }
}
