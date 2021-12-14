import 'dart:convert';

GameListModel gameListModelFromJson(String str) => GameListModel.fromJson(json.decode(str));

String gameListModelToJson(GameListModel data) => json.encode(data.toJson());

class GameListModel {
    GameListModel({
        this.succes,
        this.result,
    });

    bool? succes;
    List<Result>? result;

    factory GameListModel.fromJson(Map<String, dynamic> json) => GameListModel(
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
        this.gameNote,
        this.gamePlayerCount,
        this.gameSubstituteCount,
        this.gameTime,
        this.saloonId,
        this.userId,
        this.maxPlayerCount,
        this.maxSubstituteCount,
        this.sportName,
        this.saloonAddress,
        this.saloonFeature,
        this.saloonName,
        this.isPassed,
    });

    int? id;
    String? gameNote;
    int? gamePlayerCount;
    int? gameSubstituteCount;
    DateTime? gameTime;
    int? saloonId;
    int? userId;
    int? maxPlayerCount;
    int? maxSubstituteCount;
    String? sportName;
    String? saloonAddress;
    String? saloonFeature;
    String? saloonName;
    bool? isPassed;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        gameNote: json["gameNote"],
        gamePlayerCount: json["gamePlayerCount"],
        gameSubstituteCount: json["gameSubstituteCount"],
        gameTime: DateTime.parse(json["gameTime"]),
        saloonId: json["saloonId"],
        userId: json["userId"],
        maxPlayerCount: json["maxPlayerCount"],
        maxSubstituteCount: json["maxSubstituteCount"],
        sportName: json["sportName"],
        saloonAddress: json["saloonAddress"],
        saloonFeature: json["saloonFeature"],
        saloonName: json["saloonName"],
        isPassed: json["isPassed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "gameNote": gameNote,
        "gamePlayerCount": gamePlayerCount,
        "gameSubstituteCount": gameSubstituteCount,
        "gameTime": gameTime.toString(),
        "saloonId": saloonId,
        "userId": userId,
        "maxPlayerCount": maxPlayerCount,
        "maxSubstituteCount": maxSubstituteCount,
        "sportName": sportName,
        "saloonAddress": saloonAddress,
        "saloonFeature": saloonFeature,
        "saloonName": saloonName,
        "isPassed": isPassed,
    };
}
