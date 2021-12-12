import 'dart:convert';

List<GameListModel> gameListModelFromJson(String str) => List<GameListModel>.from(json.decode(str).map((x) => GameListModel.fromJson(x)));

String gameListModelToJson(List<GameListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameListModel {
    GameListModel({
        this.id,
        this.sportId,
        this.userId,
        this.saloonId,
        this.gameNote,
        this.gamePassed,
        this.gameTime,
        this.gamePlayerCount,
        this.gameSubstituteCount,
    });

    int? id;
    int? sportId;
    int? userId;
    int? saloonId;
    String? gameNote;
    bool? gamePassed;
    DateTime? gameTime;
    int? gamePlayerCount;
    int? gameSubstituteCount;

    factory GameListModel.fromJson(Map<String, dynamic> json) => GameListModel(
        id: json["id"],
        sportId: json["sportId"],
        userId: json["userId"],
        saloonId: json["saloonId"],
        gameNote: json["gameNote"],
        gamePassed: json["gamePassed"],
        gameTime: DateTime.parse(json["gameTime"]),
        gamePlayerCount: json["gamePlayerCount"],
        gameSubstituteCount: json["gameSubstituteCount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sportId": sportId,
        "userId": userId,
        "saloonId": saloonId,
        "gameNote": gameNote,
        "gamePassed": gamePassed,
        "gameTime": gameTime.toString(),
        "gamePlayerCount": gamePlayerCount,
        "gameSubstituteCount": gameSubstituteCount,
    };
}
