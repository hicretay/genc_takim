// ignore_for_file: avoid_print
import 'dart:io';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genc_takim/view/LoginRegisterPages/splash_page.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //   locale: const Locale('tr'),
    //   localizationsDelegates: const [
    //   // ... app-specific localization delegate[s] here
    //   GlobalMaterialLocalizations.delegate,
    //   GlobalWidgetsLocalizations.delegate,
    //   DefaultCupertinoLocalizations.delegate,
    // ],
    // // ignore: prefer_const_literals_to_create_immutables
    // supportedLocales: [
    //   //const Locale('en', 'US'), // English
    //   const Locale('tr'), 
    // ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.transparent,
      ),
      home: const SplashPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
