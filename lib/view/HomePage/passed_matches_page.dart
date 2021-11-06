// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class PassedMatchesPage extends StatelessWidget {
  const PassedMatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 120),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(      
            height: deviceHeight(context)*0.15,  
            width: deviceWidth(context),     
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                image: DecorationImage(image: AssetImage("assets/images/voleyball.jpg"),fit: BoxFit.cover)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Flexible(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                   BorderedText(
                     strokeWidth: 2.0,
                     child: const Text("Yer:", style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20))),
                   BorderedText(
                     strokeWidth: 2.0,
                     child: const Text("Konya Belediyesi Kapalı Spor Salonu",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20,)))])),
                 Flexible(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     BorderedText(
                     strokeWidth: 2.0,
                       child: const Text("Tarih / Saat:",textAlign: TextAlign.center,  style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20))),
                     BorderedText(
                       strokeWidth: 2.0,
                       child: const Text("04.11.2021\n12.30 - 13.40", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20)))]))]),
            ),
        ),

         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(      
            height: deviceHeight(context)*0.15,       
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                image: DecorationImage(image: AssetImage("assets/images/football.png"),fit: BoxFit.cover)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Flexible(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                   BorderedText(
                     strokeWidth: 2.0,
                     child: const Text("Yer:", style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20))),
                   BorderedText(
                     strokeWidth: 2.0,
                     child: const Text("Konya Belediyesi Kapalı Spor Salonu",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20,)))])),
                 Flexible(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     BorderedText(
                     strokeWidth: 2.0,
                       child: const Text("Tarih / Saat:",textAlign: TextAlign.center,  style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20))),
                     BorderedText(
                       strokeWidth: 2.0,
                       child: const Text("03.11.2021\n12.30 - 13.40", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20)))]))]),
            ),
        ),

      ],
    );
  }
}