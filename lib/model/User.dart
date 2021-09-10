// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userName,
    this.email,
    this.phoneNumber,
    this.password,
  });

  String? userName;
  String? email;
  String? phoneNumber;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json["userName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "email": email,
    "phoneNumber": phoneNumber,
    "password": password,
  };
}
