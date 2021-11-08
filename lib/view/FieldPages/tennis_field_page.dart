// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/FieldPages/widgets/full_empty_circle_widget.dart';

class TennisFieldPage extends StatefulWidget {
  TennisFieldPage({Key? key}) : super(key: key);

  @override
  _TennisFieldPageState createState() => _TennisFieldPageState();
}

class _TennisFieldPageState extends State<TennisFieldPage> {
  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tenis Sahası",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
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
       image: AssetImage("assets/images/tenis_sahasi.jpg"),fit: BoxFit.cover)
       ),
       // ignore: prefer_const_literals_to_create_immutables
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           // ignore: prefer_const_literals_to_create_immutables
           children: [
           FullEmptyCircleWidget(),
           FullEmptyCircleWidget()
         ],),
       ),
     )
      ));
  }
}