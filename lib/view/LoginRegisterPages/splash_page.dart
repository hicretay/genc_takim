// ignore_for_file: prefer_const_constructors_in_immutables, file_names
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/LoginRegisterPages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushAndRemoveUntil(context,
       MaterialPageRoute(builder: (context) => const LoginPage()),(route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth(context),
      height: deviceHeight(context)*0.1,
      decoration: const BoxDecoration(
        color: secondaryColor2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding*4),
        child: Image.asset("assets/logos/logowhite.png"),
      ),
    );
  }
}