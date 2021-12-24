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
  List gameListData = [];
  int selectedIndex = -1;

  Future getGamesList() async{
    final GameListModel? games = await userGameList(1,false);
    if(!mounted)
    return;
    setState(() {
      gameListData = games!.result!;
    });
    return gameListData;
  }

  @override
  void initState() {
    getGamesList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getGamesList(),
      builder: (context, snapshot) {
      if(snapshot.hasError){
        return Center(child: Text("Hata Oluştu"));
      }
      else{
        if(snapshot.hasData){
        dynamic gamedata = snapshot.requireData;
        return ListView.builder(
          itemCount: gameListData.length,
          itemBuilder: (context, index){    
          DateTime gameDate = gamedata[index].gameTime;
          String date = (gameDate.day <= 9 ? "0"+ gameDate.day.toString() :  
                         gameDate.day.toString()) +"."+ (gameDate.month <= 9 ? "0" + gameDate.month.toString() :  
                         gameDate.month.toString()) +"."+ gameDate.year.toString();
    
          String time = gameDate.hour <= 9 ? "0"+ gameDate.hour.toString() :  
                            gameDate.hour.toString() + ":" + (gameDate.minute <= 9 ? "0" + gameDate.minute.toString() : gameDate.minute.toString());
    
          bool isFull = (gamedata[index].gamePlayerCount == gamedata[index].maxPlayerCount) || 
                        (gamedata[index].gameSubstituteCount == gamedata[index].maxSubstituteCount)  ? true : false;
    
          return selectedIndex != index ? 
            MatchContainerWidget(
              fullEmptyIcon: Icon( isFull ? Icons.cancel_outlined : Icons.check_circle_outline,color: isFull ? Colors.red : primaryColor,size: 20),
              fullEmpty: isFull ? "Kontenjan yok" : "Kontenjan var",
              imageName: gamedata[index].sportName,
              sportName: gamedata[index].sportName,
              saloon: gamedata[index].saloonName,
              date: date,
              time: time,
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketballFieldPage()));
              },
              expandedonTap: ()
               {
                 setState(() {
                   selectedIndex = index;
                 });
               },
              exitTeamRow: Row(children: [
                Text("Takımdan çık",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
                Icon(Icons.exit_to_app,color: Colors.white,size: 20)]),
              ):
              ExpandedMatchContainerWidget(
              fullEmptyIcon: Icon( isFull ? Icons.cancel_outlined : Icons.check_circle_outline,color: isFull ? Colors.red : primaryColor,size: 20),
              fullEmpty: isFull ? "Kontenjan yok" : "Kontenjan var",
              imageName: gamedata[index].sportName,
              sportName: gamedata[index].sportName,
              saloon: gamedata[index].saloonName,
              date: date,
              time: time,
              gameNote: gamedata[index].gameNote,
              gamerCount: gamedata[index].gamePlayerCount,
              substituteCount: gamedata[index].gameSubstituteCount,
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketballFieldPage()));
              },
              expandedonTap: (){
                 setState(() {
                   selectedIndex = -1;
                 });
               },
               exitTeamRow: Row(children: [
                Text("Takımdan çık",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
                Icon(Icons.exit_to_app,color: Colors.white,size: 20)]),
              );
             // SizedBox(height: defaultPadding)
        });
      }
      else{
        return circularBasic;
      }
      }     
      }
    );
  }
}
