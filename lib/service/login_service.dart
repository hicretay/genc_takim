// ignore_for_file: prefer_adjacent_string_concatenation
import 'package:genc_takim/model/login_model.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:http/http.dart' as http;

Future<LoginModel?> userLogin(String userEmail, String userPassword) async {
  final response = await http.post(Uri.parse(baseUrl + "User/Login"),
      body: '{"userEmail":' + '"$userEmail"' + ',' +'"userPassword":' + '"$userPassword"'+ '}',
      headers: header,
      );

    if (response.statusCode == 200) {
    final String responseString = response.body;
    return loginModelFromJson(responseString);     
  } else {
    return null;
  }
}