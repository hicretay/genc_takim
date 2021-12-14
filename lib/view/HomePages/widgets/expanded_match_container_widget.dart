// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class ExpandedMatchContainerWidget extends StatefulWidget {
  final String saloon;
  final String date;
  final String time;
  final String sportName;
  final String imageName;
  final String gameNote;
  final VoidCallback onTap, expandedonTap;
  final String fullEmpty;
  final Icon fullEmptyIcon;
  final int gamerCount, substituteCount;

  
  const ExpandedMatchContainerWidget({
    Key? key, 
    required this.saloon, 
    required this.date, 
    required this.time, 
    required this.onTap, 
    required this.sportName, 
    required this.imageName, 
    required this.fullEmpty, 
    required this.fullEmptyIcon, 
    required this.expandedonTap, 
    required this.gameNote, 
    required this.gamerCount, 
    required this.substituteCount,
  }) : super(key: key);

  @override
  State<ExpandedMatchContainerWidget> createState() => _ExpandedMatchContainerWidgetState();
}

class _ExpandedMatchContainerWidgetState extends State<ExpandedMatchContainerWidget> {
  @override
  Widget build(BuildContext context) {
    bool isChecked=false;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(      
          height: deviceHeight(context)*0.35,       
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(25)),              
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Flexible(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                     Text(widget.sportName,style: TextStyle(color: primaryColor,fontFamily: font,fontSize: 18)),
                     Container(width: 50,height: 50,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/icons/${widget.imageName}.png")))),
                     ]),
                 ),
                 Flexible(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                   const Text("Yer:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 18)),
                   Text(widget.saloon,textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20,))])),
                 Flexible(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                       const Text("Tarih / Saat:",textAlign: TextAlign.center,  style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 18)),
                       Text("${widget.date}\n${widget.time}", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily:contentFont,fontSize: 20))]))]),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                   Column(
                     children: [
                     Text("Oyuncu Sayısı:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 18)),
                     Text(widget.gamerCount.toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20))]),

                   Column(
                     children: [
                     Text("Yedek Oyuncu Sayısı:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 18)),
                     Text(widget.substituteCount.toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20,))]),
                 ]),

                  Text(widget.gameNote,textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: maxSpace),
                        child: Row(children: [
                          widget.fullEmptyIcon,
                          Text(widget.fullEmpty,style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16))]),
                      ),
                      GestureDetector(
                        child: Icon(isChecked==false ? Icons.expand_less_outlined : Icons.expand_less_outlined,color: primaryColor,size: 30),
                        onTap: widget.expandedonTap
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: maxSpace),
                        child: Row(children: [
                          Text("Takımdan çık",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
                          Icon(Icons.exit_to_app,color: Colors.white,size: 20),]),
                      ),
                    ],
                  )
                ],
            ),
          ),
      ),
        onTap: widget.onTap
    );
  }
}