// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePage/widgets/team_options_widget.dart';
import 'package:genc_takim/view/make_team_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 170),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            TeamOptionsWidget(
              leading  : "Takım Kur",
              iconImage: AssetImage("assets/images/makeTeam.png"),
              onTap    : (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MakeTeamPage()));
              },
            ),

            TeamOptionsWidget(
              leading  : "Takıma Katıl",
              iconImage: AssetImage("assets/images/addPlayer.png"),
              onTap    : (){},
            ),
          ]),

          SizedBox(height: deviceHeight(context)*0.02),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              TeamOptionsWidget(
              leading: "Yaklaşan Maçlar",
              iconImage: AssetImage("assets/images/match.png"),
              onTap: (){},
            ),

            TeamOptionsWidget(
              leading: "Yakınındaki Maçlar",
              iconImage: AssetImage("assets/images/map.png"),
              onTap: (){},
            ),
            
          ])
        ],
      ),
    );
  }
}

