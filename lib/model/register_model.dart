// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        this.succes,
        this.result,
    });

    bool? succes;
    String? result;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        succes: json["succes"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "succes": succes,
        "result": result,
    };
}
