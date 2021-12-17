import 'dart:convert';

GameSaveModel gameSaveModelFromJson(String str) => GameSaveModel.fromJson(json.decode(str));

String gameSaveModelToJson(GameSaveModel data) => json.encode(data.toJson());

class GameSaveModel {
    GameSaveModel({
        this.succes,
        this.result,
    });

    bool? succes;
    String? result;

    factory GameSaveModel.fromJson(Map<String, dynamic> json) => GameSaveModel(
        succes: json["succes"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "succes": succes,
        "result": result,
    };
}
