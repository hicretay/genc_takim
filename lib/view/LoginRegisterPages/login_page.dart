// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePage/home_nav_bar_widget.dart';

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
            child: Container(
          decoration: BoxDecoration(
           color: Colors.black,
          //  image: DecorationImage(
          //    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          //  image: AssetImage("assets/images/bakanlik_logo.png"))
           ),
          child: Container(
            height: deviceHeight(context)*0.45,
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: defaultPadding,left: defaultPadding),
                      child: Text("Telefon Numarası",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                      color: Colors.grey[700],
                      
                      )),
                    ),
                  ),

                   Padding(
                   padding: const EdgeInsets.only(left: defaultPadding,right: defaultPadding),
                   child: TextFormField(
                   decoration: const InputDecoration(
                  fillColor: Colors.amber,
                   border: UnderlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.amber
                     )
                   ),
                   enabledBorder: UnderlineInputBorder(
                     borderSide: BorderSide(
                       color: primaryColor
                     )
                   ),
                   focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(
                       color: primaryColor
                     )
                   ),
                   labelText: "Telefon numaranızı giriniz",
                   labelStyle: TextStyle(color: Colors.grey,fontSize: 16)
                 ),
                ),
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
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => HomeNavBarWidget()),(route) => false);
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
                         Text("Google",style: TextStyle(color: Colors.grey,fontSize: 16)),
                         Container(width: 1,height: deviceHeight(context)*0.04,color: Colors.white),
                         Text("Facebook",style: TextStyle(color: Colors.grey,fontSize: 16)),
                       ],
                     ),
                    ),
                  )
                ],
              ),
          ),
        ),
        ),
        
        
      ),
    );
  }
}