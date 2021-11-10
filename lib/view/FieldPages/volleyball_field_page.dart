// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/FieldPages/widgets/full_empty_circle_widget.dart';

class VolleyballFieldPage extends StatefulWidget {
  const VolleyballFieldPage({Key? key}) : super(key: key);

  @override
  _VolleyballFieldPageState createState() => _VolleyballFieldPageState();
}

class _VolleyballFieldPageState extends State<VolleyballFieldPage> {
  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Voleybol Sahası",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: secondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),

      body: Container(
      decoration: BoxDecoration(
       image: DecorationImage(
       image: AssetImage("assets/images/voleybol_sahasi.jpg"),fit: BoxFit.cover)
       ),
       // ignore: prefer_const_literals_to_create_immutables
       child: Column(
         //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
         Padding(
           padding: EdgeInsets.only(left: deviceWidth(context)*0.15, right: deviceWidth(context)*0.17, top: deviceWidth(context)*0.28,bottom: deviceWidth(context)*0.35),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: const [
             FullEmptyCircleWidget(),
             FullEmptyCircleWidget(),
             FullEmptyCircleWidget()
           ],),
         ),

          Padding(
             padding: EdgeInsets.only(left: deviceWidth(context)*0.15, right: deviceWidth(context)*0.17,bottom: deviceWidth(context)*0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
              FullEmptyCircleWidget(),
              FullEmptyCircleWidget(),
              FullEmptyCircleWidget()
            ],),
          ),

          Padding(
             padding: EdgeInsets.only(left: deviceWidth(context)*0.15, right: deviceWidth(context)*0.17,bottom: deviceWidth(context)*0.35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
              FullEmptyCircleWidget(),
              FullEmptyCircleWidget(),
              FullEmptyCircleWidget()
            ],),
          ),

         Padding(
            padding: EdgeInsets.only(left: deviceWidth(context)*0.15, right: deviceWidth(context)*0.17),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: const [
             FullEmptyCircleWidget(),
             FullEmptyCircleWidget(),
             FullEmptyCircleWidget()
           ],),
         ),
       ],),
     )
      ));
  }
}