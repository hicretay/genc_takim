import 'dart:convert';

UserMatchDeleteModel userMatchDeleteModelFromJson(String str) => UserMatchDeleteModel.fromJson(json.decode(str));

String userMatchDeleteModelToJson(UserMatchDeleteModel data) => json.encode(data.toJson());

class UserMatchDeleteModel {
    UserMatchDeleteModel({
        this.succes,
        this.result,
    });

    bool? succes;
    String? result;

    factory UserMatchDeleteModel.fromJson(Map<String, dynamic> json) => UserMatchDeleteModel(
        succes: json["succes"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "succes": succes,
        "result": result,
    };
}