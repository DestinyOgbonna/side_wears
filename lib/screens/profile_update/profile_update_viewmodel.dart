import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/services/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel() : super(ProfileState());

  final picker = ImagePicker();
  final storage = FileStorage();
  late String imagepath;
  late String imagename;

  Future<void> updateUserDetails(
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
          uploadToFireStore();
          Fluttertoast.showToast(
              msg: "Profile Update Successful",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          context.router.pop();
        }).catchError((err) {
          Fluttertoast.showToast(
              msg: err.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
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
        state = state.copyWith(loadingState: LoadingState.error);
      }
    }
  }

//* UPLOAD IMAGE FROM Gallary FUNCTION
  Future<void> uploadProfileImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        state = state.copyWith(loadingState: LoadingState.loading);
        final imageGallery = File(pickedFile.path);
        state = state.copyWith(
            loadingState: LoadingState.success, image: imageGallery);
        imagepath = pickedFile.path;
        imagename = pickedFile.name;
      }
    } on PlatformException catch (e) {
      Fluttertoast.showToast(
          msg: '$e',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      state = state.copyWith(loadingState: LoadingState.error);
    }
  }

//* UPLOAD IMAGE TO FIRESTORE FUNCTION
  Future<void> uploadToFireStore() async {
    storage.uploadFiles(imagepath, imagename);
  }

//* UPLOAD IMAGE FROM CAMERA FUNCTION
  uploadProfileImageFromCamera() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final imageCamera = File(pickedFile.path);
        state = state.copyWith(
            loadingState: LoadingState.success, image: imageCamera);
        imagepath = pickedFile.path;
        imagename = pickedFile.name;
      }
    } on PlatformException catch (e) {
      Fluttertoast.showToast(
          msg: '$e',
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

class ProfileState {
  File? image;
  LoadingState loadingState;
  ProfileState({this.loadingState = LoadingState.loading, this.image});

  ProfileState copyWith({
    LoadingState? loadingState,
    File? image,
  }) {
    return ProfileState(
      loadingState: loadingState ?? this.loadingState,
      image: image ?? this.image,
    );
  }
}
