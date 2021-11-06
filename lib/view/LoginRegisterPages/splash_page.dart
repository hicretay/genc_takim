// ignore_for_file: prefer_const_constructors_in_immutables, file_names
import 'package:flutter/material.dart';
import 'package:genc_takim/view/HomePage/home_nav_bar_widget.dart';

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
       MaterialPageRoute(builder: (context) => HomeNavBarWidget()),(route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}