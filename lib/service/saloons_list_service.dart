import 'package:genc_takim/model/saloons_list_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

//-------------------------TÜM SALONLAR--------------------------------
Future<SaloonsListModel?>? allSaloonsList() async {
  final response = await http.post(
    Uri.parse(baseUrl + "SaloonList"),
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return saloonsListModelFromJson(responseString);
    
  } else {
    return null;
  }
}
//------------------------------------------------------------------