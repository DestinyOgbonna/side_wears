import 'package:building_ui/exports/exports.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel() : super(ProfileState());

  final picker = ImagePicker();
  String? image;

  Future updateUserDetails(
      TextEditingController phoneController,
      TextEditingController nameController,
      TextEditingController userNameController,
      TextEditingController addressController,
      BuildContext context) async {
    if (phoneController.text.isEmpty ||
        userNameController.text.isEmpty ||
        addressController.text.isEmpty ||
        nameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please fill all the fields',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //  state = state.copyWith(loadingState: LoadingState.error);
      context.router.pop();
    } else {
      try {
        final changeUserDetails = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'phone': phoneController.text.toString().trim(),
          'username': userNameController.text.toString().trim(),
          'name': nameController.text.toString().trim(),
          'address': addressController.text.toString().trim(),
        }).then((value) {
          Fluttertoast.showToast(
              msg: "Successful",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          context.router.pop();
          // state = state.copyWith(loadingState: LoadingState.success);
        }).catchError((err) {
          Fluttertoast.showToast(
              msg: err.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          //  state = state.copyWith(loadingState: LoadingState.error);
        });
        return changeUserDetails;
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
            msg: '${e.message}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        //  state = state.copyWith(loadingState: LoadingState.error);
      } on SocketException {
        Fluttertoast.showToast(
            msg: 'Please check your internet connection',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        //   state = state.copyWith(loadingState: LoadingState.error);
      }
    }
  }

  uploadProfileImageToFirebase() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    File(pickedFile!.path);
    if (pickedFile.path.isEmpty) {
      retrieveLostFileData();
    }
  }

  void retrieveLostFileData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }

    if (response.file != null) {
      File(response.file!.path);
    } else {
      print(response.file);
    }
  }
}

class ProfileState {
  String? image;
  ProfileState({this.image = ''});

//  ProfileState copyWith({List? image}) {
  // return ProfileState(image: image ?? this.image);
  // }
}
