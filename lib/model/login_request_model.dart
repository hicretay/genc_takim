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



// class LoginRequestModel {
//   String? email;
//   String? password;

//   LoginRequestModel({this.email, this.password});

//   LoginRequestModel.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['email'] = this.email;
//     data['password'] = this.password;
//     return data;
//   }
// }