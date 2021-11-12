// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class MatchContainerWidget extends StatelessWidget {
  final String saloon;
  final String date;
  final String time;
  final String sportName;
  final String imageName;
  final VoidCallback onTap;
  
  const MatchContainerWidget({
    Key? key, required this.saloon, required this.date, required this.time, required this.onTap, required this.sportName, required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(      
          height: deviceHeight(context)*0.15,       
            decoration: BoxDecoration(
              color: secondaryColor,
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
                 Container(width: 50,height: 50,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/icons/$imageName.png")))),
                 ]),
               Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                 const Text("Yer:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 20)),
                 Text(saloon,textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20,))])),
               Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   const Text("Tarih / Saat:",textAlign: TextAlign.center,  style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 20)),
                   Text("$date\n$time", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily:contentFont,fontSize: 20))]))]),
          ),
      ),
        onTap: onTap
    );
  }
}