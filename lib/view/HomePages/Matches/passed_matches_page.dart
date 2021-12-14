// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/model/game_list_model.dart';
import 'package:genc_takim/service/game_list_service.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/widgets/expanded_match_container_widget.dart';
import 'package:genc_takim/view/HomePages/widgets/match_container_widget.dart';

class PassedMatchesPage extends StatefulWidget {
  const PassedMatchesPage({Key? key}) : super(key: key);

  @override
  State<PassedMatchesPage> createState() => _PassedMatchesPageState();
}

class _PassedMatchesPageState extends State<PassedMatchesPage> {
  bool checked = false;
    List gameListData = [];
  DateTime today = DateTime.now();


  Future getGamesList() async{
    final GameListModel? games = await gameList(1,true);
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


      bool isFull = (gameListData[index].gamePlayerCount == gameListData[index].maxPlayerCount) || (gameListData[index].gameSubstituteCount == gameListData[index].maxSubstituteCount)  ? true : false;
      return checked == false ? 
        MatchContainerWidget(
          fullEmptyIcon: Icon( isFull ? Icons.cancel_outlined : Icons.check_circle_outline,color: isFull ? Colors.red : primaryColor,size: 20),
          fullEmpty: isFull ? "Kontenjan yok" : "Kontenjan var",
          imageName: gameListData[index].sportName,
          sportName: gameListData[index].sportName,
          saloon: gameListData[index].saloonName,
          date: gameListData[index].gameTime.toString(),
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
            Icon(Icons.exit_to_app,color: Colors.white,size: 20)]),
          ):
          ExpandedMatchContainerWidget(
          fullEmptyIcon: Icon( isFull ? Icons.cancel_outlined : Icons.check_circle_outline,color: isFull ? Colors.red : primaryColor,size: 20),
          fullEmpty: isFull ? "Kontenjan yok" : "Kontenjan var",
          imageName: gameListData[index].sportName,
          sportName: gameListData[index].sportName,
          saloon: gameListData[index].saloonName,
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