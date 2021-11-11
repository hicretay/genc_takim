// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class ComingMatchesPage extends StatelessWidget {
  const ComingMatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        const SizedBox(height: 110),
        MatchContainerWidget(
          assetImage: AssetImage("assets/images/basketball.jpg"),
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketballFieldPage()));
          },
          ),

          MatchContainerWidget(
          assetImage:AssetImage("assets/images/voleyball.jpg"),
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> VolleyballFieldPage()));
          },
          ),

          MatchContainerWidget(
          assetImage: AssetImage("assets/images/football.png"),
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> FootballFieldPage(numberOfPlayer: 12)));
          },
          ),
      ],
    );
  }
}

class MatchContainerWidget extends StatelessWidget {
  final ImageProvider assetImage;
  final String saloon;
  final String date;
  final String time;
  final VoidCallback onTap;
  
  const MatchContainerWidget({
    Key? key, required this.assetImage, required this.saloon, required this.date, required this.time, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(      
          height: deviceHeight(context)*0.15,       
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(image: assetImage,fit: BoxFit.cover),
              
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
                   child: Text(saloon,textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20,)))])),
               Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   BorderedText(
                   strokeWidth: 2.0,
                     child: const Text("Tarih / Saat:",textAlign: TextAlign.center,  style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20))),
                   BorderedText(
                     strokeWidth: 2.0,
                     child: Text("$date\n$time", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "RacingSansOne",fontSize: 20)))]))]),
          ),
      ),
        onTap: onTap
    );
  }
}