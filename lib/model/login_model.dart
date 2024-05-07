
import 'package:la_vapiano/API/Api.dart';

class LoginModel{
  String? username,mobile,address,email,password;

  LoginModel({
    required this.username,
    this.mobile,
    this.address,
    this.email,
    this.password,
    });

  // Convert Product object to a map for serialization
  Map<String, dynamic> toJson() {
    return {
      ApiKey.key_username: username,
      ApiKey.key_mobile: mobile,
      ApiKey.key_address: address,
      ApiKey.key_email: email,
      ApiKey.key_password: password,
    };
  }

  // Create a Product object from a map
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json[ApiKey.key_username],
      mobile: json[ApiKey.key_mobile],
      address: json[ApiKey.key_address],
      email: json[ApiKey.key_email],
      password: json[ApiKey.key_password],
    );
  }
}