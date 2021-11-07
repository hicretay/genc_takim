// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class BasketballFieldPage extends StatefulWidget {
  const BasketballFieldPage({Key? key}) : super(key: key);

  @override
  _BasketballFieldPageState createState() => _BasketballFieldPageState();
}

class _BasketballFieldPageState extends State<BasketballFieldPage> {
   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Futbol Sahası",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: secondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),

      body: Container(
      decoration: BoxDecoration(
       image: DecorationImage(
      // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
       image: AssetImage("assets/images/basketbol_sahasi.jpg"),fit: BoxFit.cover)
       ),
       // ignore: prefer_const_literals_to_create_immutables
       child: Column(children: [
         Center(child: Text("data")),
         
       ],),
     )
      ));
  }
}