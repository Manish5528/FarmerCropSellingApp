import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.email,
    this.name,
    this.uid,
    this.city,
    this.phoneno,
  });

  String? email;
  String? name;
  String? uid;
  String? city;
  String? phoneno;


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    name: json["name"],
    uid: json["uid"],
    city: json["city"],
    phoneno: json["phoneno"],


  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstName": name,
    "uid": uid,
    "city": city,
    "phoneno": phoneno,

  };
}
