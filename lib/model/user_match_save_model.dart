import 'dart:convert';

UserMatchSaveModel userMatchSaveModelFromJson(String str) => UserMatchSaveModel.fromJson(json.decode(str));

String userMatchSaveModelToJson(UserMatchSaveModel data) => json.encode(data.toJson());

class UserMatchSaveModel {
    UserMatchSaveModel({
        this.succes,
        this.result,
    });

    bool? succes;
    String? result;

    factory UserMatchSaveModel.fromJson(Map<String, dynamic> json) => UserMatchSaveModel(
        succes: json["succes"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "succes": succes,
        "result": result,
    };
}