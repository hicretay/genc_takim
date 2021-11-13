// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/widgets/expanded_match_container_widget.dart';
import 'package:genc_takim/view/HomePages/widgets/match_container_widget.dart';

class ComingMatchesPage extends StatefulWidget {
  const ComingMatchesPage({Key? key}) : super(key: key);

  @override
  State<ComingMatchesPage> createState() => _ComingMatchesPageState();
}

class _ComingMatchesPageState extends State<ComingMatchesPage> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        const SizedBox(height: 110),
        checked == false ? 
        MatchContainerWidget(
          fullEmptyIcon: Icon(Icons.cancel_outlined,color: Colors.red,size: 20),
          fullEmpty: "Kontenjan yok",
          imageName: "basketball",
          sportName: "Basketbol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketballFieldPage()));
          },
          expandedonTap: ()
           {
             setState(() {
               checked=!checked;
             });
           },
           exitTeamRow: Row(children: [
            Text("Takımdan çık",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
            Icon(Icons.exit_to_app,color: Colors.white,size: 20),]),
          ):
          ExpandedMatchContainerWidget(
          fullEmptyIcon: Icon(Icons.cancel_outlined,color: Colors.red,size: 20),
          fullEmpty: "Kontenjan yok",
          imageName: "basketball",
          sportName: "Basketbol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketballFieldPage()));
          },
          expandedonTap: (){
             setState(() {
               checked=!checked;
             });
           },
          ),

          MatchContainerWidget(
          fullEmptyIcon: Icon(Icons.check_circle_outline,color: primaryColor,size: 20),
          fullEmpty: "Kontenjan var",
          imageName: "volleyball",
          sportName: "Voleybol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> VolleyballFieldPage()));
          },
                    expandedonTap: ()
           {
            //  setState(() {
            //    checked=!checked;
            //  });
           },
           exitTeamRow: Row(children: [
            Text("Takımdan çık",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
            Icon(Icons.exit_to_app,color: Colors.white,size: 20),]),
          ),

          MatchContainerWidget(
          fullEmptyIcon: Icon(Icons.check_circle_outline,color: primaryColor,size: 20),
          fullEmpty: "Kontenjan var",
          imageName: "football",
          sportName: "Futbol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> FootballFieldPage(numberOfPlayer: 12)));
          },
            expandedonTap: ()
           {
            //  setState(() {
            //    checked=!checked;
            //  });
           },
            exitTeamRow: Row(children: [
            Text("Takımdan çık",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
            Icon(Icons.exit_to_app,color: Colors.white,size: 20),]),
          ),

          MatchContainerWidget(
          fullEmptyIcon: Icon(Icons.cancel_outlined,color: Colors.red,size: 20),
          fullEmpty: "Kontenjan yok",
          imageName: "tennis",
          sportName: "Tenis",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> FootballFieldPage(numberOfPlayer: 12)));
          },
                    expandedonTap: ()
           {
            //  setState(() {
            //    checked=!checked;
            //  });
           },
            exitTeamRow: Row(children: [
            Text("Takımdan çık",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
            Icon(Icons.exit_to_app,color: Colors.white,size: 20),]),
          ),
      ],
    );
  }
}
