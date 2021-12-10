import 'dart:io';

import 'package:dio/dio.dart';
import 'package:genc_takim/model/login_response_model.dart';
import 'package:genc_takim/model/login_request_model.dart';
import 'package:genc_takim/service/ILoginService.dart';

class LoginService extends ILoginService{ // ILoginService sınıfından türeyecek
  LoginService(Dio dio) : super(dio);

  //-------------------servise post isteği gönderilmesi-----------------------
  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    final response = await dio.post(loginPath, data: model);
    if(response.statusCode == HttpStatus.ok){
      return LoginResponseModel.fromJson(response.data);
    }
    else{
      return null;
    }
  }
  //--------------------------------------------------------------------------
  
}