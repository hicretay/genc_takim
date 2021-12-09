import 'package:flutter/material.dart';

const primaryColor = Color(0xff2F7327);
const secondaryColor = Color(0x8c2A2D2E);
const secondaryColor2 = Color(0xff2A2D2E);
const bgColor = Color(0xFF1C1F1F);

const font = "RacingSansOne";
const contentFont = "TekoRegular";
const baseUrl = "https://172.24.46.42/genctakim/";
final GlobalKey<FormState> formKey = GlobalKey(); 

TextStyle contentTextStyle = const TextStyle(
  fontFamily: font,
  fontSize: 20,
  color: primaryColor
);

deviceHeight(BuildContext context)=>
 MediaQuery.of(context).size.height;
// Cihaz ekran yüksekliği

deviceWidth(BuildContext context)=>
 MediaQuery.of(context).size.width; 
//Cihaz ekran genişliği

const defaultPadding = 16.0;
const cardCurved = 20.0;
const minCurved = 3.0;

const minSpace = 5.0;
const maxSpace = 10.0;

const iconSize = 25.0;

var circularBasic = const Center(child: CircularProgressIndicator(backgroundColor: primaryColor,valueColor: AlwaysStoppedAnimation<Color>(secondaryColor)));

