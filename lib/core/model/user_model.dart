import 'package:building_ui/core/exports/exports.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? username;
  String? profileImage;

  UserModel({this.name, this.email, this.username, this.id, this.profileImage});

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    //  SnapshotOptions? options,
  ) {
    final data = snapshot!.data();
    return UserModel(
        name: data?['name'],
        email: data?['email'],
        username: data?['username'],
        profileImage: data?['profile_image']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (username != null) "username": username,
      if (profileImage != null) "profile_image": profileImage,
    };
  }
}
