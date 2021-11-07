// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/FieldPages/football_field_page.dart';

class MakeTeamPage extends StatefulWidget {
  const MakeTeamPage({Key? key}) : super(key: key);

  @override
  _MakeTeamPageState createState() => _MakeTeamPageState();
}

class _MakeTeamPageState extends State<MakeTeamPage> {
  List<String>? items = ["Futbol", "Basketbol", "Voleybol"];
  String selectedSport = "Futbol";
  
  @override
  Widget build(BuildContext context) {
    //String dropdownValue = "Futbol";
    //String _chosenValue = "Futbol";
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
           image: AssetImage("assets/images/logo.png"))
           ),
          child: Container(
            height: deviceHeight(context)*0.85,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(119, 119, 119, 0.15),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                 //-----------------------------SPOR DALI SEÇİMİ---------------------------------------
                    Padding(
                    padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding*2,),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Spor Dalı",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.8,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.white,
                          ),
                          child:  Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.black,
                                iconSize: 30,
                                dropdownColor: Colors.white,
                                value: selectedSport,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("Futbol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Futbol"),
                                  DropdownMenuItem(child: Center(child: Text("Basketbol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Basketbol"),
                                  DropdownMenuItem(child: Center(child: Text("Voleybol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Voleybol"),
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
                      child: Text("Spor Salonu",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.8,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.white,
                          ),
                          child:  Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.black,
                                iconSize: 30,
                                dropdownColor: Colors.white,
                                value: selectedSport,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("Futbol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Futbol"),
                                  DropdownMenuItem(child: Center(child: Text("Basketbol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Basketbol"),
                                  DropdownMenuItem(child: Center(child: Text("Voleybol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Voleybol"),
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

                  //-----------------------------TARİH SEÇİMİ---------------------------------------
                    Padding(
                    padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Tarih",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.8,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.white,
                          ),
                          child:  Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.black,
                                iconSize: 30,
                                dropdownColor: Colors.white,
                                value: selectedSport,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("Futbol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Futbol"),
                                  DropdownMenuItem(child: Center(child: Text("Basketbol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Basketbol"),
                                  DropdownMenuItem(child: Center(child: Text("Voleybol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Voleybol"),
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

                   //-----------------------------SAAT SALONU SEÇİMİ---------------------------------------
                    Padding(
                    padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Saat",style: TextStyle(color: Colors.white)))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                        width: deviceWidth(context)*0.8,
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.white,
                          ),
                          child:  Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                iconEnabledColor: Colors.black,
                                iconSize: 30,
                                dropdownColor: Colors.white,
                                value: selectedSport,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  DropdownMenuItem(child: Center(child: Text("Futbol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Futbol"),
                                  DropdownMenuItem(child: Center(child: Text("Basketbol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Basketbol"),
                                  DropdownMenuItem(child: Center(child: Text("Voleybol",style: TextStyle(color: Colors.black, fontSize: 14))),value: "Voleybol"),
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
                          MaterialPageRoute(builder: (context) => FootballFieldPage()));
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