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
          sportName: "Basketbol",
          icon: Icon(Icons.sports_basketball, color: Colors.white,size: 50),
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketballFieldPage()));
          },
          ),

          MatchContainerWidget(
          sportName: "Voleybol",
          icon: Icon(Icons.sports_volleyball, color: Colors.white,size: 50),
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> VolleyballFieldPage()));
          },
          ),

          MatchContainerWidget(
          sportName: "Futbol",
          icon: Icon(Icons.sports_soccer, color: Colors.white,size: 50),
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
