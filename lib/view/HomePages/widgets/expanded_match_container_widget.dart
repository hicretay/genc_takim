// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class ExpandedMatchContainerWidget extends StatefulWidget {
  final String saloon;
  final String date;
  final String time;
  final String sportName;
  final String imageName;
  final VoidCallback onTap, expandedonTap;
  final String fullEmpty;
  final Icon fullEmptyIcon;

  
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
              // image: DecorationImage(image: assetImage,fit: BoxFit.cover),
              
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
                   const Text("Yer:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 20)),
                   Text(widget.saloon,textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20,))])),
                 Flexible(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                       const Text("Tarih / Saat:",textAlign: TextAlign.center,  style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 20)),
                       Text("${widget.date}\n${widget.time}", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily:contentFont,fontSize: 20))]))]),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                   Column(
                     // ignore: prefer_const_literals_to_create_immutables
                     children: [
                     Text("Oyuncu Sayısı:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 18)),
                     Text("12",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20))]),

                   Column(
                     // ignore: prefer_const_literals_to_create_immutables
                     children: [
                     Text("Yedek Oyuncu Sayısı:", style: TextStyle(color: primaryColor, fontFamily: "RacingSansOne",fontSize: 18)),
                     Text("4",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20,))]),
                 ]),

                  Text("Oyun Konya Anadolu Lisesi öğrencileri arasında oynanacaktır. ",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: contentFont,fontSize: 20)),
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
                        padding: const EdgeInsets.only(left: maxSpace),
                        child: Row(children: [
                          Icon(Icons.check,color: Colors.transparent,size: 20),
                          Text(widget.fullEmpty,style: TextStyle(color: Colors.transparent,fontFamily: contentFont,fontSize: 16))]),
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