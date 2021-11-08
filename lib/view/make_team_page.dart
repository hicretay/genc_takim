// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/FieldPages/basketball_field_page.dart';
import 'package:genc_takim/view/FieldPages/football_field_page.dart';
import 'package:genc_takim/view/FieldPages/tennis_field_page.dart';
import 'package:genc_takim/view/FieldPages/volleyball_field_page.dart';

class MakeTeamPage extends StatefulWidget {
 
  const MakeTeamPage({Key? key}) : super(key: key);

  @override
  _MakeTeamPageState createState() => _MakeTeamPageState();
}

class _MakeTeamPageState extends State<MakeTeamPage> {
  String selectedSport = "Futbol";
  String selectedSaloon = "Konya Selçuklu Spor Salonu";
  String selectedDate = "07.11.2021";
  String selectedTime= "10:00";
  int selectedPlayerNumber = 10;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Takım Kur",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),
        body: Container(
          color: secondaryColor,
          child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.black,
            ),
            child: Container(
          decoration: BoxDecoration(
           color: Colors.black,
           image: DecorationImage(
             colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
           image: AssetImage("assets/logos/logo.png"))
           ),
          child: Container(
            height: deviceHeight(context)*0.85,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(119, 119, 119, 0.15),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
              child: Column(
                children: [
                 //-----------------------------SPOR DALI SEÇİMİ---------------------------------------
                    Padding(
                    padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding*2),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Spor Dalı Seç",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.9,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: secondaryColor2,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.white,
                                iconSize: 30,
                                dropdownColor: secondaryColor2,
                                value: selectedSport,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("Futbol",style: TextStyle(color: Colors.white, fontSize: 14))),value: "Futbol"),
                                  DropdownMenuItem(child: Center(child: Text("Basketbol",style: TextStyle(color: Colors.white, fontSize: 14))),value: "Basketbol"),
                                  DropdownMenuItem(child: Center(child: Text("Voleybol",style: TextStyle(color: Colors.white, fontSize: 14))),value: "Voleybol"),
                                  DropdownMenuItem(child: Center(child: Text("Tenis",style: TextStyle(color: Colors.white, fontSize: 14))),value: "Tenis"),
                                ],
                                onChanged: (value) {
                                 setState(() {
                                   selectedSport = value.toString();
                                 });
                                 },
                                ),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ),
                   //---------------------------------------------------------------------------------------------------

                   //-----------------------------SPOR SALONU SEÇİMİ---------------------------------------
                    Padding(
                    padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Spor Salonu Seç",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.9,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: secondaryColor2,
                          ),
                          child:  Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.white,
                                iconSize: 30,
                                dropdownColor: secondaryColor2,
                                value: selectedSaloon,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("Konya Selçuklu Spor Salonu",style: TextStyle(color: Colors.white, fontSize: 14))),value: "Konya Selçuklu Spor Salonu"),
                                  DropdownMenuItem(child: Center(child: Text("Gençlik Merkezi Salonu",style: TextStyle(color: Colors.white, fontSize: 14))),value: "Gençlik Merkezi Salonu"),
                                  DropdownMenuItem(child: Center(child: Text("Voleybol2",style: TextStyle(color: Colors.white, fontSize: 14))),value: "Voleybol2"),
                                ],
                                onChanged: (value) {
                                 setState(() {
                                   selectedSaloon = value.toString();
                                 });
                                 },
                                ),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ),
                   //---------------------------------------------------------------------------------------------------

                  //-----------------------------TARİH SEÇİMİ---------------------------------------
                    Padding(
                    padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Tarih Seç",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.9,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: secondaryColor2,
                          ),
                          child:  Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.white,
                                iconSize: 30,
                                dropdownColor: secondaryColor2,
                                value: selectedDate,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("07.11.2021",style: TextStyle(color: Colors.white, fontSize: 14))),value: "07.11.2021"),
                                  DropdownMenuItem(child: Center(child: Text("08.11.2021",style: TextStyle(color: Colors.white, fontSize: 14))),value: "08.11.2021"),
                                  DropdownMenuItem(child: Center(child: Text("09.11.2021",style: TextStyle(color: Colors.white, fontSize: 14))),value: "09.11.2021"),
                                ],
                                onChanged: (value) {
                                 setState(() {
                                   selectedDate = value.toString();
                                 });
                                 },
                                ),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ),
                   //---------------------------------------------------------------------------------------------------

                   //-----------------------------SAAT SEÇİMİ---------------------------------------
                    Padding(
                    padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Saat Seç",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.9,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: secondaryColor2,
                          ),
                          child:  Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.white,
                                iconSize: 30,
                                dropdownColor: secondaryColor2,
                                value: selectedTime,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("10:00",style: TextStyle(color: Colors.white, fontSize: 14))),value: "10:00"),
                                  DropdownMenuItem(child: Center(child: Text("11:00",style: TextStyle(color: Colors.white, fontSize: 14))),value: "11:00"),
                                  DropdownMenuItem(child: Center(child: Text("12:00",style: TextStyle(color: Colors.white, fontSize: 14))),value: "12:00"),
                                ],
                                onChanged: (value) {
                                 setState(() {
                                   selectedTime = value.toString();
                                 });
                                 },
                                ),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ),
                   //---------------------------------------------------------------------------------------------------

                 //-----------------------------OYUNCU SAYISI SEÇİMİ---------------------------------------
                    Padding(
                    padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Oyuncu Sayısı Seç",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.9,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: secondaryColor2,
                          ),
                          child:  Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.white,
                                iconSize: 30,
                                dropdownColor: secondaryColor2,
                                value: selectedPlayerNumber,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("10",style: TextStyle(color: Colors.white, fontSize: 14))),value: 10),
                                  DropdownMenuItem(child: Center(child: Text("12",style: TextStyle(color: Colors.white, fontSize: 14))),value: 12),
                                  DropdownMenuItem(child: Center(child: Text("14",style: TextStyle(color: Colors.white, fontSize: 14))),value: 14),
                                ],
                                onChanged: (value) {
                                 setState(() {
                                   selectedPlayerNumber = value!;
                                 });
                                 },
                                ),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ),
                   //---------------------------------------------------------------------------------------------------

                  Padding(
                    padding: const EdgeInsets.all(defaultPadding*2),
                    child: SizedBox(
                      width: deviceWidth(context)*0.6,
                      height: deviceHeight(context)*0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                        ),
                        child: Text("Sahadan Konum Seç",
                        style: TextStyle(
                          fontFamily: font,
                          color: Colors.white,
                          fontSize: 20
                        )),
                        onPressed: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => 
                          selectedSport=="Futbol" ?
                          FootballFieldPage(numberOfPlayer: selectedPlayerNumber):
                          selectedSport=="Basketbol" ? BasketballFieldPage() : selectedSport=="Tenis" ? TennisFieldPage() : VolleyballFieldPage()));
                        }),
                    ),
                  ),
                ],
              ),
          ),
        ),
        ),
        )));
  }
}