// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/Home/near_matches.dart';
import 'package:genc_takim/view/HomePages/Home/upcoming_matches_page.dart';
import 'package:genc_takim/view/HomePages/widgets/team_options_widget.dart';
import 'package:genc_takim/view/HomePages/Home/add_team_page.dart';
import 'package:genc_takim/view/HomePages/Home/make_team_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //final LoginResponseModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 170),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              TeamOptionsWidget(
                leading  : "Takım Kur", //model.birthdate.toString(),
                iconImage: AssetImage("assets/icons/makeTeam.png"),
                onTap    : (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MakeTeamPage()));
                },
              ),
      
              TeamOptionsWidget(
                leading  : "Takıma Katıl",
                iconImage: AssetImage("assets/icons/addPlayer.png"),
                onTap    : (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTeamPage()));
                },
              ),
            ]),
      
            SizedBox(height: deviceHeight(context)*0.02),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TeamOptionsWidget(
                leading: "Yaklaşan Maçlar",
                iconImage: AssetImage("assets/icons/match.png"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpComingMatchesPage()));
                },
              ),
      
              TeamOptionsWidget(
                leading: "Yakınındaki Maçlar",
                iconImage: AssetImage("assets/icons/map.png"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NearMatchesPage()));
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}

