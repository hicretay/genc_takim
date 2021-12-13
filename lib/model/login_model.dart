// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.succes,
        this.result,
    });

    bool? succes;
    Result? result;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        succes: json["succes"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "succes": succes,
        "result": result!.toJson(),
    };
}

class Result {
    Result({
        this.id,
        this.userName,
        this.userEmail,
        this.userPassword,
        this.active,
        this.userTelephone,
        this.birthdate,
        this.registrationTime,
    });

    int? id;
    String? userName;
    String? userEmail;
    String? userPassword;
    bool? active;
    String? userTelephone;
    int? birthdate;
    dynamic registrationTime;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        userName: json["userName"],
        userEmail: json["userEmail"],
        userPassword: json["userPassword"],
        active: json["active"],
        userTelephone: json["userTelephone"],
        birthdate: json["birthdate"],
        registrationTime: json["registrationTime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "userEmail": userEmail,
        "userPassword": userPassword,
        "active": active,
        "userTelephone": userTelephone,
        "birthdate": birthdate,
        "registrationTime": registrationTime,
    };
}
