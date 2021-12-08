// // ignore_for_file: prefer_collection_literals
// ignore_for_file: prefer_collection_literals

class LoginResponseModel {
  int? id;
  String? userName;
  String? userEmail;
  String? userPassword;
  bool? active;
  String? userTelephone;
  int? birthdate;
  DateTime? registrationTime;

  LoginResponseModel(
      {this.id,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.active,
      this.userTelephone,
      this.birthdate,
      this.registrationTime});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    userPassword = json['userPassword'];
    active = json['active'];
    userTelephone = json['userTelephone'];
    birthdate = json['birthdate'];
    registrationTime = json['registrationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['userName'] = userName;
    data['userEmail'] = userEmail;
    data['userPassword'] = userPassword;
    data['active'] = active;
    data['userTelephone'] = userTelephone;
    data['birthdate'] = birthdate;
    data['registrationTime'] = registrationTime;
    return data;
  }
}
