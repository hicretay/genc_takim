// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/widgets/home_nav_bar_widget.dart';
import 'package:genc_takim/view/LoginRegisterPages/register_page.dart';
import 'package:genc_takim/view/LoginRegisterPages/widgets/textformfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController telNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.black,
            // image: DecorationImage(
            // image: AssetImage("assets/images/bakanlik_logo.png"))
            ),
            child: Padding(
              padding: EdgeInsets.only(top: deviceHeight(context)*0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      SizedBox(
                      width: deviceWidth(context)*0.4,
                      height: deviceWidth(context)*0.4,
                      child: Image.asset("assets/logos/logowhite.png")),

                      SizedBox(width: deviceWidth(context)*0.1),

                      SizedBox(
                      width: deviceWidth(context)*0.4,
                      height: deviceWidth(context)*0.4,
                      child: Image.asset("assets/logos/bakanlik_logo.png")),
                    ],
                ),
                Container(
                decoration: BoxDecoration(
                 color: Colors.black,
                //  image: DecorationImage(
                //    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                //  image: AssetImage("assets/images/bakanlik_logo.png"))
                 ),
                child: Container(
                height: deviceHeight(context)*0.6,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(119, 119, 119, 0.15),
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

                  TextFormFieldWidget(leading: "E - Posta", labelText: "E - Posta adresinizi giriniz"),
                  TextFormFieldWidget(leading: "Şifre", labelText: "Şifrenizi giriniz"),
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
                              onPressed: (){
                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeNavBarWidget(tabIndex: 0)), (route) => false);
                              }),
                          ),
                        ),
              
                        Padding(
                            padding: const EdgeInsets.only(right: defaultPadding,left: defaultPadding),
                            child: Text("ile devam et",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            color: Colors.grey[700],
                            )),
                          ),
              
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: deviceWidth(context),
                            height: deviceHeight(context)*0.06,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
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
                        )
                    ],
                  ),
                          ),
                        ),
                      ],
              ),
            ),
        ),
        
        
      ),
    );
  }
}