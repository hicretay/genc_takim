// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/model/game_list_model.dart';
import 'package:genc_takim/service/game_list_service.dart';
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
  List gameListData = [];

  Future getGamesList() async{
    final List<GameListModel?>? games = await gameList(1);
    setState(() {
      gameListData = games!;
    });
  }

  @override
  void initState() {
    getGamesList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameListData.length,
      itemBuilder: (context, index){
      return checked == false ? 
        MatchContainerWidget(
          fullEmptyIcon: Icon(Icons.cancel_outlined,color: Colors.red,size: 20),
          fullEmpty: "Kontenjan yok",
          imageName: "basketball",
          sportName: gameListData[index].sportId == 1 ? "Futbol" : gameListData[index].sportId == 2 ? "Basketbol" : gameListData[index].sportId == 3 ? "Voleybol" : "Tenis",
          saloon: "Selçuk Üniversitesi 19 Mayıs Spor Salonu",
          date: "14.11.2021",
          time: "10.30 - 11.40",
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
          sportName: gameListData[index].sportId == 1 ? "Futbol" : gameListData[index].sportId == 2 ? "Basketbol" : gameListData[index].sportId == 3 ? "Voleybol" : "Tenis",
          saloon: "Selçuk Üniversitesi 19 Mayıs Spor Salonu",
          date: gameListData[index].gameTime.toString(),
          time: "10.30 - 11.40",
          gameNote: gameListData[index].gameNote,
          gamerCount: gameListData[index].gamePlayerCount,
          substituteCount: gameListData[index].gameSubstituteCount,
          onTap: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketballFieldPage()));
          },
          expandedonTap: (){
             setState(() {
               checked=!checked;
             });
           },
          );
         // SizedBox(height: defaultPadding)
    });
  }
}
