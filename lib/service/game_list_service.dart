import 'package:genc_takim/model/game_list_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

Future<List<GameListModel?>?> gameList(int id) async {
  final response = await http.post(
    Uri.parse(baseUrl + "Games/List"),
    body: '{"userId":' + id.toString() + '}',
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return gameListModelFromJson(responseString);
    
  } else {
    return null;
  }
}
