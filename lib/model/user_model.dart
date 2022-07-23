class UserModel {
  String? name;
  String? email;
  String? username;

  UserModel({this.name, this.email, this.username});

 UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        username: json['username'] as String,
      ); //!< Map<String, dynamic> json) => UserModel(

  Map<String, dynamic> toJson() {
    return {
      "name": name ?? 'Error sending name',
      "email": email ?? 'Error sending email',
      "username": username ?? 'Error sending username',
    };
  }
}
