import 'package:genc_takim/model/game_list_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

Future<GameListModel?>? gameList(int id, bool isPassed) async {
  final response = await http.post(
    Uri.parse(baseUrl + "UserGame/List"),
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
