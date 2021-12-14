// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/FieldPages/football_field_page.dart';
import 'package:genc_takim/view/HomePages/Home/make_team_page.dart';
import 'package:genc_takim/view/HomePages/widgets/match_container_widget.dart';

class UpComingMatchesPage extends StatefulWidget {
  UpComingMatchesPage({Key? key}) : super(key: key);

  @override
  _UpComingMatchesPageState createState() => _UpComingMatchesPageState();
}

class _UpComingMatchesPageState extends State<UpComingMatchesPage> {
  bool checked = false;
  TextEditingController teSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Yaklaşan Maçlar",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),
        body: Container(
          color: secondaryColor,
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
            child: SizedBox(
              height: deviceHeight(context)*0.06,
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
          ),
            MatchContainerWidget(
              fullEmptyIcon: Icon(Icons.check,color: primaryColor,size: 20),
              fullEmpty: "Kontenjan var",
              imageName: "Futbol",
              sportName: "Futbol",
              saloon: "Konya Belediyesi Kapalı Spor Salonu", 
              date: "03.11.2021", 
              time: "12.30 - 13.40", 
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FootballFieldPage(numberOfPlayer: 12)));
              },
              expandedonTap: ()
              {
                setState(() {
                  checked=!checked;
                });
              },
             // ignore: prefer_const_literals_to_create_immutables
             exitTeamRow: Row(children: [
             Text("Takıma Katıl",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
             Icon(Icons.add_circle_outline_rounded,color: Colors.white,size: 20)]),
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