// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePage/home_nav_bar_widget.dart';
import 'package:genc_takim/view/LoginRegisterPages/widgets/textFormField_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            child: Container(
          decoration: BoxDecoration(
          color: Colors.black,
          //  image: DecorationImage(
          //    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          //  image: AssetImage("assets/images/bakanlik_logo.png"))
          ),
          child: Container(
            height: deviceHeight(context)*0.8,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: const Text("Kayıt Ol",
                    style: TextStyle(
                      fontFamily: font,
                      color: Colors.white,
                      fontSize: 25
                    )),
                  ),
                  TextFormFieldWidget(leading: "Ad Soyad",labelText: "Ad ve Soyadınızı giriniz"),
                  TextFormFieldWidget(leading: "E - Posta",labelText: "E - Posta adresinizi giriniz"),
                  TextFormFieldWidget(leading: "Telefon Numarası",labelText: "Telefon numaranızı giriniz"),
                  TextFormFieldWidget(leading: "Doğum Tarihi",labelText: "Doğum Tarihinizi giriniz"),

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
                          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomeNavBarWidget(tabIndex: 0)),(route) => false);
                        }),
                    ),
                  ),
                ],
              ),
          ),
        ),
        ),
      ),
    );
  }
}
