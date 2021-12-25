import 'package:genc_takim/model/game_list_model.dart';
import 'package:genc_takim/model/user_match_list_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

//-------------------OYUN KURUCUYA AİT OYUNLAR-------------------------
Future<GameListModel?>? userGameList(int id, bool isPassed) async {
  final response = await http.post(
    Uri.parse(baseUrl + "Games/UserGameList"),
    body: '{"userId":' + id.toString() + ',' + '"IsPassed":'+ isPassed.toString() + '}',
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return gameListModelFromJson(responseString);
    
  } else {
    return null;
  }
}
//--------------------------------------------------------------------

//-------------------KULLANICIYA AİT MAÇLAR-------------------------
Future<UserGameListModel?>? userMatchList(int id, bool isPassed) async {
  final response = await http.post(
    Uri.parse(baseUrl + "UserGames/UserGamesList"),
    body: '{"userId":' + id.toString() + ',' + '"IsPassed":'+ isPassed.toString() + '}',
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return userGameListModelFromJson(responseString);
    
  } else {
    return null;
  }
}
//--------------------------------------------------------------------
//-------------------------TÜM OYUNLAR--------------------------------
Future<GameListModel?>? allGameList() async {
  final response = await http.post(
    Uri.parse(baseUrl + "Games/AllMatchesList"),
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return gameListModelFromJson(responseString);
    
  } else {
    return null;
  }
}
//------------------------------------------------------------------

//-------------------YAKLAŞAN TÜM MAÇLAR----------------------------
Future<GameListModel?>? comingGameList(bool isPassed) async {
  final response = await http.post(
    Uri.parse(baseUrl + "Games/ComingMatchesList"),
    body: '{"IsPassed":' + isPassed.toString() + '}',
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return gameListModelFromJson(responseString);
    
  } else {
    return null;
  }
}
//------------------------------------------------------------------