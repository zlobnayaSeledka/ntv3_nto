import 'package:flutter/cupertino.dart';
class User{
  String name;
  bool is_active;
  List<dynamic> scopes;
  String registered_at;
  String email;
  bool is_verified;
  User({
    required this.name,
    required this.is_active,
    required this.scopes,
    required this.registered_at,
    required this.email,
    required this.is_verified,
  });

  Map<dynamic, dynamic> toJson(){

    Map json = <dynamic, dynamic>{};
    json['name'] = name;
    json['is_active'] = is_active;
    json['scopes'] = scopes;
    json['registered_at'] = registered_at;
    json['email'] = email;
    json['is_verified'] = is_verified;
    return json;
  }

  factory User.fromJson(Map <dynamic, dynamic> json){
    return User(
      name: json['name'],
      is_active: json['is_active'],
      scopes: json['scopes'],
      registered_at: json['registered_at'],
      email: json['email_account']['email'],
      is_verified: json['email_account']['is_verified']
    );
  }

}
