
// ignore_for_file: prefer_const_constructors

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class MatchContainerWidget extends StatelessWidget {
  final Icon icon;
  final String saloon;
  final String date;
  final String time;
  final String sportName;
  final VoidCallback onTap;
  
  const MatchContainerWidget({
    Key? key, required this.icon, required this.saloon, required this.date, required this.time, required this.onTap, required this.sportName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(      
          height: deviceHeight(context)*0.15,       
            decoration: BoxDecoration(
              color: secondaryColor2,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              // image: DecorationImage(image: assetImage,fit: BoxFit.cover),
              
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                 Text(sportName,style: TextStyle(color: primaryColor,fontFamily: font,fontSize: 18),),
                 icon,
                 ]),
               Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                 BorderedText(
                   strokeWidth: 2.0,
                   child: const Text("Yer:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 20))),
                 BorderedText(
                   strokeWidth: 2.0,
                   child: Text(saloon,textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 18,)))])),
               Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   BorderedText(
                   strokeWidth: 2.0,
                     child: const Text("Tarih / Saat:",textAlign: TextAlign.center,  style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 20))),
                   BorderedText(
                     strokeWidth: 2.0,
                     child: Text("$date\n$time", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 18)))]))]),
          ),
      ),
        onTap: onTap
    );
  }
}