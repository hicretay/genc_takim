import 'dart:convert';
import 'package:genc_takim/model/register_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

Future<RegisterModel?> userRegister(int id, String userName, String userEmail, String userPassword, String userTelephone, String birthdate) async{
  var bodys ={};
  bodys["id"]           = id;
  bodys["userName"]     = userName;
  bodys["userEmail"]    = userEmail;
  bodys["userPassword"] = userPassword;
  bodys["userTelephone"]= userTelephone;
  bodys["birthdate"]    = birthdate;

  String body = json.encode(bodys);

  final response = await http.post(
    Uri.parse(baseUrl + "User/Save"),
    body: body,
    headers: header
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return registerModelFromJson(responseString);
  } else {
    // ignore: avoid_print
    print(response.statusCode);
    return null;
  }
}