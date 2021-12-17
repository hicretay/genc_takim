// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures
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
    final GameListModel? games = await userGameList(1,false);
    if(!mounted)
    return;
    setState(() {
      gameListData = games!.result!;
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

      DateTime gameDate = gameListData[index].gameTime;
      String date = (gameDate.day <= 9 ? "0"+ gameDate.day.toString() :  
                     gameDate.day.toString()) +"."+ (gameDate.month <= 9 ? "0" + gameDate.month.toString() :  
                     gameDate.month.toString()) +"."+ gameDate.year.toString();

      String time = gameDate.hour <= 9 ? "0"+ gameDate.hour.toString() :  
                        gameDate.hour.toString() + ":" + (gameDate.minute <= 9 ? "0" + gameDate.minute.toString() : gameDate.minute.toString());

      bool isFull = (gameListData[index].gamePlayerCount == gameListData[index].maxPlayerCount) || 
                    (gameListData[index].gameSubstituteCount == gameListData[index].maxSubstituteCount)  ? true : false;

      return checked == false ? 
        MatchContainerWidget(
          fullEmptyIcon: Icon( isFull ? Icons.cancel_outlined : Icons.check_circle_outline,color: isFull ? Colors.red : primaryColor,size: 20),
          fullEmpty: isFull ? "Kontenjan yok" : "Kontenjan var",
          imageName: gameListData[index].sportName,
          sportName: gameListData[index].sportName,
          saloon: gameListData[index].saloonName,
          date: date,
          time: time,
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
            Icon(Icons.exit_to_app,color: Colors.white,size: 20)]),
          ):
          ExpandedMatchContainerWidget(
          fullEmptyIcon: Icon( isFull ? Icons.cancel_outlined : Icons.check_circle_outline,color: isFull ? Colors.red : primaryColor,size: 20),
          fullEmpty: isFull ? "Kontenjan yok" : "Kontenjan var",
          imageName: gameListData[index].sportName,
          sportName: gameListData[index].sportName,
          saloon: gameListData[index].saloonName,
          date: date,
          time: time,
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
