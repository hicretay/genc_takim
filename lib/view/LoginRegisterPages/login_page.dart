// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:genc_takim/model/login_model.dart';
import 'package:genc_takim/service/login_service.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/settings/functions.dart';
import 'package:genc_takim/view/HomePages/widgets/home_nav_bar_widget.dart';
import 'package:genc_takim/view/LoginRegisterPages/register_page.dart';
import 'package:genc_takim/view/LoginRegisterPages/widgets/textformfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  ),
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
                    Container(
                    decoration: BoxDecoration(
                    color: Colors.black,
                    ),
                    child: Container(
                    height: deviceHeight(context)*0.6,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: const Text("Haydi Başlayalım",
                              style: TextStyle(
                                fontFamily: font,
                                color: Colors.white,
                                fontSize: 25
                              )),
                            ),
                      TextFormFieldWidget(
                        leading: "E - Posta", 
                        labelText: "E - Posta adresinizi giriniz", 
                        controller: emailController,
                      ),
                      TextFormFieldWidget(
                        leading: "Şifre", 
                        labelText: "Şifrenizi giriniz", 
                        controller: passwordController,
                      ),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding*2),
                              child: SizedBox(
                                width: deviceWidth(context)*0.6,
                                height: deviceHeight(context)*0.06,
                                child: ElevatedButton(
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
                                  onPressed: () async{
                                   if(emailController.text != null && passwordController.text != null){
                                     
                                     //////////////////////
                                     final LoginModel? userData = await userLogin(emailController.text, passwordController.text); 
                                     if(userData!.succes == true){ 
                                       showToast(context, "Giriş başarılı");
                                       SharedPreferences preferences = await SharedPreferences.getInstance();
                                       preferences.setString("email", emailController.text);
                                       preferences.setInt("userId", userData.result!.id ?? 0);
                                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeNavBarWidget(tabIndex: 0)), (route) => false);
                                     }
                                     else{
                                       showAlert(context, "Hatalı giriş!");
                                     }
                                   }
                                   else{
                                     showAlert(context, "Lütfen E-Posta ve şifrenizi giriniz");
                                   }
                                  }),
                              ),
                            ),
                            GestureDetector(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: defaultPadding,left: defaultPadding),
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
                  ],
                  ),
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