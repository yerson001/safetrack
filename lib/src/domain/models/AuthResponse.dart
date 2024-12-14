import 'dart:convert';

import 'package:safetrack/src/domain/models/User.dart';

AuthResponse authResponceFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponceToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  User user;
  String token;

  AuthResponse({
    required this.user,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}
