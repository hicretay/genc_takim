// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class MatchContainerWidget extends StatefulWidget {
  final String saloon;
  final String date;
  final String time;
  final String sportName;
  final String imageName;
  final VoidCallback expandedonTap;
  final String fullEmpty;
  final Icon fullEmptyIcon;
  final Widget? exitTeamRow;

  const MatchContainerWidget({
    Key? key, 
    required this.saloon, 
    required this.date, 
    required this.time, 
    required this.sportName, 
    required this.imageName, 
    required this.fullEmpty, 
    required this.fullEmptyIcon,
    required this.expandedonTap, 
    this.exitTeamRow,
  }) : super(key: key);

  @override
  State<MatchContainerWidget> createState() => _MatchContainerWidgetState();
}

class _MatchContainerWidgetState extends State<MatchContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(      
        height: deviceHeight(context)*0.18,       
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
                   //Text(widget.fullEmpty,style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16))
                   ]),
               ),
               Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                 const Text("Yer:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 18)),
                 Text(widget.saloon,textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 18,))])),
               Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                     const Text("Tarih / Saat:",textAlign: TextAlign.center,  style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 18)),
                     Text("${widget.date}\n${widget.time}", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily:contentFont,fontSize: 18))]))]),

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
                      child: Icon(Icons.expand_more_outlined,color: primaryColor,size: 30),
                      onTap: widget.expandedonTap
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: maxSpace),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: widget.exitTeamRow
                      
                    ),
                  ],
                )
              ],
          ),
        ),
    );
  }
}