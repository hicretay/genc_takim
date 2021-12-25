import 'dart:convert';
import 'package:genc_takim/model/user_match_save_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

Future<UserMatchSaveModel?> userGameSave(int gameId, int userId, int userLocation, bool isSubstitute) async{
  var bodys ={};
  bodys["gameId"]             = gameId;
  bodys["userId"]             = userId;
  bodys["userLocation"]       = userLocation;
  bodys["isSubstitute"]       = isSubstitute;

  String body = json.encode(bodys);

  final response = await http.post(
    Uri.parse(baseUrl + "UserMatch/Save"),
    body: body,
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return userMatchSaveModelFromJson(responseString);
  } else {
    // ignore: avoid_print
    print(response.statusCode);
    return null;
  }
}