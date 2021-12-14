// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:genc_takim/model/game_list_model.dart';
import 'package:genc_takim/service/game_list_service.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/Home/make_team_page.dart';
import 'package:genc_takim/view/HomePages/widgets/expanded_match_container_widget.dart';
import 'package:genc_takim/view/HomePages/widgets/match_container_widget.dart';

class UpComingMatchesPage extends StatefulWidget {
  UpComingMatchesPage({Key? key}) : super(key: key);

  @override
  _UpComingMatchesPageState createState() => _UpComingMatchesPageState();
}

class _UpComingMatchesPageState extends State<UpComingMatchesPage> {
  bool checked = false;
    List gameListData = [];

  Future getGamesList() async{
    final GameListModel? games = await comingGameList(false);
    setState(() {
      gameListData = games!.result!;
    });
  }

  @override
  void initState() {
    getGamesList();
    super.initState();
  }
  
  TextEditingController teSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Yaklaşan Maçlar",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),
        body: Container(
          color: secondaryColor,
          child: Container(
          decoration: BoxDecoration(
           color: Colors.black,
           image: DecorationImage(
           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
           image: AssetImage("assets/logos/logowhite.png"))
           ),
          child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: deviceHeight(context)*0.06,
              child: TextField(
                cursorColor: primaryColor,
                controller: teSearch,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(maxSpace),
                  hintText: "Salon, oyun, spor ara",
                  hintStyle: TextStyle(color: primaryColor),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: primaryColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(cardCurved),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(cardCurved),
                  )
                ),
              ),
            ),
          ),
            ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
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
          }),

              Padding(
                padding: const EdgeInsets.all(defaultPadding*2),
                child: SizedBox(
                  width: deviceWidth(context)*0.6,
                  height: deviceHeight(context)*0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    child: Text("Yeni Oyun Kur",
                    style: TextStyle(
                      fontFamily: font,
                      color: Colors.white,
                      fontSize: 20
                    )),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MakeTeamPage()));
                    }),
                ),
              ),
            ],
          ),
        ),
    )));
  }
}