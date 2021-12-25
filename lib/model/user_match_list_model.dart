import 'dart:convert';

UserGameListModel userGameListModelFromJson(String str) => UserGameListModel.fromJson(json.decode(str));

String userGameListModelToJson(UserGameListModel data) => json.encode(data.toJson());

class UserGameListModel {
    UserGameListModel({
        this.succes,
        this.result,
    });

    bool? succes;
    List<Result>? result;

    factory UserGameListModel.fromJson(Map<String, dynamic> json) => UserGameListModel(
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
        this.userLocation,
        this.isSubstitute,
        this.gameUserId,
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
    int? userLocation;
    bool? isSubstitute;
    int? gameUserId;

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
        userLocation: json["userLocation"],
        isSubstitute: json["isSubstitute"],
        gameUserId: json["gameUserId"],
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
        "userLocation": userLocation,
        "isSubstitute": isSubstitute,
        "gameUserId": gameUserId,
    };
}
