import 'dart:convert';

ProfileModel profielModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));


class ProfileModel {
  final String firstName;
  final String lastName;
  final String phone;
  final dynamic photo;
  final int balance;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.photo,
    required this.balance,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    firstName: json["first_name"]??"",
    lastName: json["last_name"]??"",
    phone: json["phone"]??"",
    photo: json["photo"]??"",
    balance: json["balance"]??0,
  );

}
