// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/FieldPages/football_field_page.dart';
import 'package:genc_takim/view/HomePages/Home/make_team_page.dart';
import 'package:genc_takim/view/HomePages/widgets/match_container_widget.dart';

class AddTeamPage extends StatefulWidget {
  const AddTeamPage({Key? key}) : super(key: key);

  @override
  _AddTeamPageState createState() => _AddTeamPageState();
}

class _AddTeamPageState extends State<AddTeamPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Takıma Katıl",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
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
             colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
           image: AssetImage("assets/logos/logowhite.png"))
           ),
          child: Container(
            height: deviceHeight(context)*0.85,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(119, 119, 119, 0.15),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
              child: Column(
              children: [
                MatchContainerWidget(
                  imageName: "voleyball",
                  sportName: "Voleybol",
                  saloon: "Konya Belediyesi Kapalı Spor Salonu", 
                  date: "03.11.2021", 
                  time: "12.30 - 13.40", 
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FootballFieldPage(numberOfPlayer: 12)));
                  }),

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
        ),
        ),
    )));
  }
}