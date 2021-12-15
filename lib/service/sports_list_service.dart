import 'package:genc_takim/model/sports_list_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

//-------------------------TÜM SPORLAR--------------------------------
Future<SportsListModel?>? allSportsList() async {
  final response = await http.post(
    Uri.parse(baseUrl + "SportsList"),
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return sportsListModelFromJson(responseString);
    
  } else {
    return null;
  }
}
//------------------------------------------------------------------