// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genc_takim/service/login_service.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/widgets/home_nav_bar_widget.dart';
import 'package:genc_takim/view/LoginRegisterPages/register_page.dart';
import 'package:genc_takim/view/LoginRegisterPages/widgets/textformfield_widget.dart';
import 'package:genc_takim/viewmodel/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final GlobalKey<FormState> formKey = GlobalKey(); 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String baseUrl = "https://172.24.46.42/genctakim/";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        formKey, 
        emailController, 
        passwordController, 
        service: LoginService(Dio(BaseOptions(baseUrl: baseUrl,)))),

      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginComplete){
            // ignore: avoid_print
            //print(state.model.token);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=>HomeNavBarWidget(tabIndex: 0, model: state.model)), (route) => false);
          }
          else{
           // showAlert(context, "Bir hata oluştu !");
          }
        },
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      )
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if(state is LoginComplete){
          // ignore: avoid_unnecessary_containers
          return Container(child: Text("basarılı"),);
        }
        return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )
    ),
    child: Text("Devam",
    style: TextStyle(
      fontFamily: font,
      color: Colors.white,
      fontSize: 20
    )),
    onPressed: 
      context.watch<LoginCubit>().isLoginLoading 
      ? null : (){
        context.read<LoginCubit>().postUserModel();
      },
    );
      },
    );
  }

  Widget buildScaffold(BuildContext context, LoginState state) {
    return SafeArea(
        child: Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Colors.transparent,
        //     leading: Visibility(
        //     visible: context.watch<LoginCubit>().isLoginLoading,
        //     child: Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Center(child: CircularProgressIndicator(color: Colors.white)),
        //   ))
        // ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          autovalidateMode: state is LoginValidateState ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled) : AutovalidateMode.disabled,
          // onUserInteraction: kullanıcı etkileşime geçer geçmez aktifleşir
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Container(
                  alignment: Alignment.center,
                  height: deviceHeight(context)*0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        SizedBox(
                        width: deviceWidth(context)*0.3,
                        height: deviceWidth(context)*0.3,
                        child: Image.asset("assets/logos/logowhite.png")),
                        SizedBox(width: deviceWidth(context)*0.1),
                        SizedBox(
                        width: deviceWidth(context)*0.3,
                        height: deviceWidth(context)*0.3,
                        child: Image.asset("assets/logos/bakanlik_logo.png")),
                      ],
                  ),
                ),
                Expanded(
                  child: Container(
                  //height: deviceHeight(context)*0.1,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: const Text("Haydi Başlayalım",
                        style: TextStyle(
                          fontFamily: font,
                          color: Colors.white,
                          fontSize: 27
                        )),
                      ),
                      TextFormFieldWidget(
                        leading: "E - Posta", 
                        labelText: "E - Posta adresinizi giriniz",
                        controller: emailController),
                      SizedBox(height: deviceHeight(context)*0.03),
                      TextFormFieldWidget(
                        leading: "Şifre", 
                        labelText: "Şifrenizi giriniz",
                        controller: passwordController),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding*4),
                              child: SizedBox(
                                width: deviceWidth(context)*0.6,
                                height: deviceHeight(context)*0.06,
                                child: buildElevatedButton(context),
                              ),
                            ),
                            GestureDetector(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: defaultPadding,left: defaultPadding,bottom: defaultPadding),
                                  child: Text("Hesabınız yok mu",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                  color: Colors.grey[700],
                                  )),
                                ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: secondaryColor,
          child: Container(
            width: deviceWidth(context),
            height: deviceHeight(context)*0.06,
            decoration: BoxDecoration(
              color: secondaryColor2,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             // ignore: prefer_const_literals_to_create_immutables
             children: [
               GestureDetector(
                 child: Text("E - Posta",
                 style: TextStyle(
                 color: Colors.grey,
                 fontSize: 16)),
                 onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
                 }),
               Container(width: 0.5,height: deviceHeight(context)*0.04,color: Colors.white),
               Text("Google",style: TextStyle(color: Colors.grey,fontSize: 16)),
               Container(width: 0.5,height: deviceHeight(context)*0.04,color: Colors.white),
               Text("Facebook",style: TextStyle(color: Colors.grey,fontSize: 16)),
             ],
           ),
          ),
        ),
      ),
    );
  }
}

