// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:genc_takim/model/user_match_delete_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;


Future<UserMatchDeleteModel?> userMatchDelete(int id) async{
  var bodys ={};
  bodys["id"] = id;

  String body = json.encode(bodys);

  final response = await http.post(
    Uri.parse(baseUrl + "UserMatch/Delete"),
    body: body,
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return userMatchDeleteModelFromJson(responseString);
  } else {
    print(response.statusCode);
    return null;
  }
}

// Future<UserMatchDeleteModel?>? userMatchDelete(int id) async {
//   final response = await http.post(
//     Uri.parse(baseUrl + "UserMatch/Delete"),
//     body: '{"id":' + id.toString() + '}',
//     headers: header
//   );

//   if (response.statusCode == 200) {
//     final String responseString = response.body;
//     return userMatchDeleteModelFromJson(responseString);
    
//   } else {
//     return null;
//   }
// }