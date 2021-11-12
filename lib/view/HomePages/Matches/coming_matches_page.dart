// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/view/HomePages/widgets/match_container_widget.dart';

class ComingMatchesPage extends StatelessWidget {
  const ComingMatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        const SizedBox(height: 110),
        MatchContainerWidget(
          imageName: "basketball",
          sportName: "Basketbol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketballFieldPage()));
          },
          ),

          MatchContainerWidget(
          imageName: "volleyball",
          sportName: "Voleybol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> VolleyballFieldPage()));
          },
          ),

          MatchContainerWidget(
          imageName: "football",
          sportName: "Futbol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> FootballFieldPage(numberOfPlayer: 12)));
          },
          ),

          MatchContainerWidget(
          imageName: "tennis",
          sportName: "Tenis",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> FootballFieldPage(numberOfPlayer: 12)));
          },
          ),
      ],
    );
  }
}
