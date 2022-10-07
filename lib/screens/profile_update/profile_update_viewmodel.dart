import 'dart:developer';

import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/services/mysharedpref.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateViewModel extends StateNotifier<ProfileUpdateState> {
  ProfileUpdateViewModel(this.storage, this._readServices)
      : super(ProfileUpdateState());

  final picker = ImagePicker();
  final FileStorage storage;
  late String imagepath;
  late String imagename;
  String? downloadUrl;
  final Reader _readServices;
  String? getUserImage;

  showProgressBar() {
    state = state.copyWith(isProgress: !state.isProgress);
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
  Future<String?> upLoad() async {
    File file = File(imagepath);
    Reference ref = storage.firebaseStorage.ref().child(imagepath);
    await ref.putFile(file);
    getUserImage = await ref.getDownloadURL();
    await _readServices(prefProvider).setString(
      'imageUrl',
      '$getUserImage',
    );
    log('UEEEEEEEEEEEEE : $getUserImage');
    return getUserImage;
  }

  //* GET DOWNLOAD URL OF THE APPLICATION

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

  Future<void> updateUserDetails(
      String? phoneController,
      String? nameController,
      String? userNameController,
      String? addressController,
      BuildContext context) async {
    if (phoneController!.isEmpty ||
        userNameController!.isEmpty ||
        addressController!.isEmpty ||
        nameController!.isEmpty) {
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
        final profileImage = await _readServices(prefProvider).getString(
          'imageUrl',
        );
        log('message : $profileImage');
        final changeUserDetails = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'phone': phoneController.toString().trim(),
          'username': userNameController.toString().trim(),
          'name': nameController.toString().trim(),
          'address': addressController.toString().trim(),
          'user_image': profileImage
        }).then((value) {
          upLoad();
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
}

class ProfileUpdateState {
  File? image;
  String? imagepath;
  String? imagename;
  String? getUserImage;
  LoadingState loadingState;
  bool isProgress;
  String? getImageUrl;
  ProfileUpdateState(
      {this.loadingState = LoadingState.loading,
      this.image,
      this.getImageUrl,
      this.getUserImage,
      this.isProgress = false,
      this.imagename,
      this.imagepath});

  ProfileUpdateState copyWith({
    LoadingState? loadingState,
    String? getImageUrl,
    String? imagepath,
    bool? isProgress,
    String? imagename,
    String? getUserImage,
    File? image,
  }) {
    return ProfileUpdateState(
        loadingState: loadingState ?? this.loadingState,
        image: image ?? this.image,
        isProgress: isProgress ?? this.isProgress,
        getImageUrl: getImageUrl ?? this.getImageUrl,
        imagename: imagename ?? this.imagepath,
        imagepath: imagepath ?? this.imagepath,
        getUserImage: getUserImage ?? this.getUserImage);
  }
}
