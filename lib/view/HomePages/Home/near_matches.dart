// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/Home/make_team_page.dart';

class NearMatchesPage extends StatefulWidget {
  NearMatchesPage({Key? key}) : super(key: key);

  @override
  _NearMatchesPageState createState() => _NearMatchesPageState();
}

class _NearMatchesPageState extends State<NearMatchesPage> {
  bool checked = false;
   TextEditingController teSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Yakınındaki Maçlar",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),
        body: SingleChildScrollView(
          child: Container(
          decoration: BoxDecoration(
           color: Colors.black,
           image: DecorationImage(
           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
           image: AssetImage("assets/logos/logowhite.png"))
           ),
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  cursorColor: primaryColor,
                  controller: teSearch,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(maxSpace),
                    hintText: "Salon, oyun, spor ara",
                    hintStyle: TextStyle(color: primaryColor),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: primaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(cardCurved),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(cardCurved),
                    )
                  ),
                ),
            ),
        
        
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
                    child: Text("Yeni Oyun Kur",
                    style: TextStyle(
                      fontFamily: font,
                      color: Colors.white,
                      fontSize: 20
                    )),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MakeTeamPage()));
                    }),
                ),
              ),
            ],
          ),
          ),
        )));
  }
}