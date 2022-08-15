import 'package:building_ui/exports/exports.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? username;

  UserModel({this.name, this.email, this.username, this.id});

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
  //  SnapshotOptions? options,
  ) {
    final data = snapshot!.data();
    return UserModel(
      name: data?['name'],
      email: data?['email'],
      username: data?['username'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (username != null) "username": username,
    };
  }
}
