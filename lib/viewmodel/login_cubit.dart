import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:genc_takim/model/login_request_model.dart';
import 'package:genc_takim/model/login_response_model.dart';
import 'package:genc_takim/service/ILoginService.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  
  final GlobalKey<FormState> formKey;

  final ILoginService service;

  bool isLoginFail = false;
  bool isLoginLoading = false;

  LoginCubit(this.formKey, this.emailController, this.passwordController, {required this.service}) : super(LoginInitial());

  Future<void> postUserModel() async {
    if(formKey.currentState != null && formKey.currentState!.validate()){
      changeUserLoadingView();
      final data = await service.postUserLogin(LoginRequestModel(email: emailController.text.trim(),password: passwordController.text.trim()));
      changeUserLoadingView();

      if(data is LoginResponseModel){
        emit(LoginComplete(data));
      }
    }
    else{
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail)); // sayfaya haber verilmesini sağlar
    }

  }

  void changeUserLoadingView(){
    isLoginLoading = !isLoginLoading;
    emit(LoginLoadingState(isLoginLoading));
  }
}

abstract class LoginState{}

class LoginInitial extends LoginState{}

class LoginComplete extends LoginState{
  final LoginResponseModel model;

  LoginComplete(this.model);
}

class LoginValidateState extends LoginState{
  final bool isValidate;

  LoginValidateState(this.isValidate);
}

class LoginLoadingState extends LoginState{
  final bool isLoginLoading;

  LoginLoadingState(this.isLoginLoading);
}