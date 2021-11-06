// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 170),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              width: deviceWidth(context)*0.45,
              height: deviceHeight(context)*0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: secondaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                  width: deviceWidth(context)*0.2,
                  height: deviceHeight(context)*0.1,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/makeTeam1.png")))),
                  Text("Takım Kur",
                  style: contentTextStyle,
                  )])),
  
           Container(
              width: deviceWidth(context)*0.45,
              height: deviceHeight(context)*0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: secondaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                  width: deviceWidth(context)*0.15,
                  height: deviceHeight(context)*0.1,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/addTeam1.png")))),
                  Text("Takıma katıl",style: contentTextStyle,)]),),
           
          ]),

          SizedBox(height: deviceHeight(context)*0.02),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            
             Container(
              width: deviceWidth(context)*0.45,
              height: deviceHeight(context)*0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: secondaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  width: deviceWidth(context)*0.2,
                  height: deviceHeight(context)*0.1,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/match.png")))),
                   Text("Yaklaşan Maçlar",style: contentTextStyle)
                ]),),
  
           Container(
              width: deviceWidth(context)*0.45,
              height: deviceHeight(context)*0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: secondaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                  width: deviceWidth(context)*0.2,
                  height: deviceHeight(context)*0.1,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/map1.png")))),
                  Text("Yakınındaki Maçlar",style: contentTextStyle,)])),
          ])
        ],
      ),
    );
  }
}