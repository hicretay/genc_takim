import 'dart:convert';

SaloonsListModel saloonsListModelFromJson(String str) => SaloonsListModel.fromJson(json.decode(str));

String saloonsListModelToJson(SaloonsListModel data) => json.encode(data.toJson());

class SaloonsListModel {
    SaloonsListModel({
        this.succes,
        this.result,
    });

    bool? succes;
    List<Result>? result;

    factory SaloonsListModel.fromJson(Map<String, dynamic> json) => SaloonsListModel(
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
        this.saloonName,
        this.saloonFeature,
        this.saloonAddress,
    });

    int? id;
    String? saloonName;
    String? saloonFeature;
    String? saloonAddress;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        saloonName: json["saloonName"],
        saloonFeature: json["saloonFeature"],
        saloonAddress: json["saloonAddress"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "saloonName": saloonName,
        "saloonFeature": saloonFeature,
        "saloonAddress": saloonAddress,
    };
}
