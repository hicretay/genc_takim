// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/widgets/match_container_widget.dart';

class PassedMatchesPage extends StatefulWidget {
  const PassedMatchesPage({Key? key}) : super(key: key);

  @override
  State<PassedMatchesPage> createState() => _PassedMatchesPageState();
}

class _PassedMatchesPageState extends State<PassedMatchesPage> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        const SizedBox(height: 120),
        
          MatchContainerWidget(
          fullEmptyIcon: Icon(Icons.check_circle_outline,color: primaryColor,size: 20),
          fullEmpty: "Kontenjan var",
          imageName: "football",
          sportName: "Futbol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> VolleyballFieldPage()));
          },
                    expandedonTap: ()
           {
             setState(() {
               checked=!checked;
             });
           },
          ),

          MatchContainerWidget(
          fullEmptyIcon: Icon(Icons.cancel_outlined,color: Colors.red,size: 20),
          fullEmpty: "Kontenjan yok",
          imageName: "volleyball",
          sportName: "Voleybol",
          saloon: "Konya Belediyesi Kapalı Spor Salonu",
          date: "12.11.2021",
          time: "12.30 - 13.40",
          onTap: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> FootballFieldPage(numberOfPlayer: 12)));
          },
                    expandedonTap: ()
           {
             setState(() {
               checked=!checked;
             });
           },
          ),
      ],
    );
  }
}