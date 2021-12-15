import 'dart:convert';

SportsListModel sportsListModelFromJson(String str) => SportsListModel.fromJson(json.decode(str));

String sportsListModelToJson(SportsListModel data) => json.encode(data.toJson());

class SportsListModel {
    SportsListModel({
        this.succes,
        this.result,
    });

    bool? succes;
    List<Result>? result;

    factory SportsListModel.fromJson(Map<String, dynamic> json) => SportsListModel(
        succes: json["succes"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "succes": succes,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.sportName,
        this.maxPlayerCount,
        this.maxSubstituteCount,
    });

    int? id;
    String? sportName;
    int? maxPlayerCount;
    int? maxSubstituteCount;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        sportName: json["sportName"],
        maxPlayerCount: json["maxPlayerCount"],
        maxSubstituteCount: json["maxSubstituteCount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sportName": sportName,
        "maxPlayerCount": maxPlayerCount,
        "maxSubstituteCount": maxSubstituteCount,
    };
}
