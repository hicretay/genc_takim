import 'package:genc_takim/model/user_match_exist_location_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

//-------------------OYUNCUYA KAYITLI KONUM-------------------------
Future<UserMatchExistLocationModel?>? userMatchIsFull(int gameId) async {
  final response = await http.post(
    Uri.parse(baseUrl + "UserMatch/ExistLocation"),  //body: '{"userId":' + id.toString() + '}',
    body: '{"gameId":' + gameId.toString() + '}',
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return userMatchExistLocationModelFromJson(responseString);
    
  } else {
    return null;
  }
}
//--------------------------------------------------------------------