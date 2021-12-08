// ignore_for_file: file_names, constant_identifier_names
import 'package:dio/dio.dart';
import 'package:genc_takim/model/login_request_model.dart';
import 'package:genc_takim/model/login_response_model.dart';

abstract class ILoginService{
  final Dio dio;
  ILoginService(this.dio); 

  final loginPath = ILoginServicePath.LOGIN.rawValue;

  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath{
  LOGIN 
}

extension ILoginServicePathExtension on ILoginServicePath{
  String get rawValue{
    switch (this) {
      case ILoginServicePath.LOGIN:
      return "User/Login";
    } 
  }
}