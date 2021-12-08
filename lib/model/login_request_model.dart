// ignore_for_file: unnecessary_new, prefer_collection_literals
class LoginRequestModel {
  String? userEmail;
  String? userPassword;

  LoginRequestModel({this.userEmail, this.userPassword});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    userEmail = json['userEmail'];
    userPassword = json['userPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['userEmail'] = userEmail;
    data['userPassword'] = userPassword;
    return data;
  }
}