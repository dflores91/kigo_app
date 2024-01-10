import 'dart:convert';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginUserToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
  String status;
  String message;
  Data data;

  LoginUser({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String userId;
  String username;
  String token;
  DateTime tokenExpiration;

  Data({
    required this.userId,
    required this.username,
    required this.token,
    required this.tokenExpiration,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        username: json["username"],
        token: json["token"],
        tokenExpiration: DateTime.parse(json["tokenExpiration"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "token": token,
        "tokenExpiration": tokenExpiration.toIso8601String(),
      };
}
