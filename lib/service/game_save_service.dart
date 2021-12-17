import 'dart:convert';
import 'package:genc_takim/model/game_save_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

Future<GameSaveModel?> gameSave(int sportId, int userId, int saloonId, String gameNote, bool gamePassed, DateTime gameTime, int gamePlayerCount, int gameSubstituteCount) async{
  var bodys ={};
  bodys["sportId"]            = sportId;
  bodys["userId"]             = userId;
  bodys["saloonId"]           = saloonId;
  bodys["gameNote"]           = gameNote;
  bodys["gamePassed"]         = gamePassed;
  bodys["gameTime"]           = gameTime;
  bodys["gamePlayerCount"]    = gamePlayerCount;
  bodys["gameSubstituteCount"]= gameSubstituteCount;

  String body = json.encode(bodys);

  final response = await http.post(
    Uri.parse(baseUrl + "Match/Save"),
    body: body,
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return gameSaveModelFromJson(responseString);
  } else {
    // ignore: avoid_print
    print(response.statusCode);
    return null;
  }
}