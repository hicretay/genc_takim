// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls
import 'package:flutter/material.dart';
import 'package:genc_takim/model/game_list_model.dart';
import 'package:genc_takim/service/game_list_service.dart';
import 'package:genc_takim/service/user_match_save_service.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/settings/functions.dart';
import 'package:genc_takim/view/FieldPages/basketball_field_page.dart';
import 'package:genc_takim/view/FieldPages/football_field_page.dart';
import 'package:genc_takim/view/FieldPages/tennis_field_page.dart';
import 'package:genc_takim/view/FieldPages/volleyball_field_page.dart';
import 'package:genc_takim/view/HomePages/Home/make_team_page.dart';
import 'package:genc_takim/view/HomePages/widgets/expanded_match_container_widget.dart';
import 'package:genc_takim/view/HomePages/widgets/match_container_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTeamPage extends StatefulWidget {
  const AddTeamPage({Key? key}) : super(key: key);

  @override
  _AddTeamPageState createState() => _AddTeamPageState();
}

class _AddTeamPageState extends State<AddTeamPage> {
  int selectedIndex = -1;
  List gameListData = [];
  List selectedMatches = [];

  Future getGamesList() async{
    final GameListModel? games = await comingGameList(false);
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
  TextEditingController teSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Takıma Katıl",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),
        body: Container(
        decoration: BoxDecoration(
         color: Colors.black,
         image: DecorationImage(
         colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
         image: AssetImage("assets/logos/logo.png"))
         ),
        child: SingleChildScrollView(
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
                    hintText: "Salon, oyun, spor... ara",
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
                  onTap: (){
                    selectedMatches.clear();
                    setState(() {
                      gameListData.forEach((element) {
                        if( (element.saloonName.toLowerCase().contains(teSearch.text.toLowerCase())) || (element.sportName.toLowerCase().contains(teSearch.text.toLowerCase()))){
                          selectedMatches.add(element);
                        }
                      });
                    });
                  },
                  onChanged: (value){
                    selectedMatches.clear();
                    setState(() {
                    gameListData.forEach((element) {
                      if( (element.saloonName.toLowerCase().contains(teSearch.text.toLowerCase())) || (element.sportName.toLowerCase().contains(teSearch.text.toLowerCase()))){
                        selectedMatches.add(element);
                      }
                    });
                  });
                  },                 
                ),
              ),
            ),
            FutureBuilder(
              future: getGamesList(),
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text("Hata Oluştu"));
                }
                else{
                if(snapshot.hasData){
                dynamic gamedata = snapshot.requireData;
                return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectedMatches.isEmpty ? gameListData.length : selectedMatches.length,
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
                    imageName: selectedMatches.isEmpty ? gamedata[index].sportName : selectedMatches[index].sportName,
                    sportName: selectedMatches.isEmpty ? gamedata[index].sportName : selectedMatches[index].sportName,
                    saloon: selectedMatches.isEmpty ? gamedata[index].saloonName : selectedMatches[index].saloonName,
                    date: date,
                    time: time,
                    expandedonTap: ()
                     {
                       setState(() {
                         selectedIndex = index;
                       });
                     },
                     exitTeamRow: GestureDetector(
                       child: Row(children: [
                       Text("Takıma Katıl",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
                       Icon(Icons.add_box_outlined,color: Colors.white,size: 18)]),
                       onTap: isFull == true ? (){
                         showToast(context, "Maç dolu !");
                       }:
                       (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>

                         gamedata[index].sportName == "Futbol" ?
                         FootballFieldPage(numberOfPlayer: gamedata[index].maxPlayerCount, gameId: gamedata[index].id) :
                         gamedata[index].sportName == "Basketbol" ?
                         BasketballFieldPage(numberOfPlayer: gamedata[index].maxPlayerCount, gameId: gamedata[index].id) :
                         gamedata[index].sportName == "Voleybol" ?
                         VolleyballFieldPage(numberOfPlayer: gamedata[index].maxPlayerCount, gameId: gamedata[index].id) :
                         TennisFieldPage(numberOfPlayer: gamedata[index].maxPlayerCount, gameId: gamedata[index].id) 

                         ));
                       },
                     ),
                    ):
                    ExpandedMatchContainerWidget(
                    fullEmptyIcon: Icon( isFull ? Icons.cancel_outlined : Icons.check_circle_outline,color: isFull ? Colors.red : primaryColor,size: 20),
                    fullEmpty: isFull ? "Kontenjan yok" : "Kontenjan var",
                    imageName: selectedMatches.isEmpty ? gamedata[index].sportName : selectedMatches[index].sportName,
                    sportName: selectedMatches.isEmpty ? gamedata[index].sportName : selectedMatches[index].sportName,
                    saloon: selectedMatches.isEmpty ? gamedata[index].saloonName : selectedMatches[index].saloonName,
                    date: date,
                    time: time,
                    gameNote: gamedata[index].gameNote,
                    gamerCount: gamedata[index].gamePlayerCount,
                    substituteCount: gamedata[index].gameSubstituteCount,
                    expandedonTap: (){
                       setState(() {
                         selectedIndex = -1;
                       });
                     },
                    exitTeamRow: GestureDetector(
                       child: Row(children: [
                       Text("Takıma Katıl",style: TextStyle(color: Colors.white,fontFamily: contentFont,fontSize: 16)),
                       Icon(Icons.add_box_outlined,color: Colors.white,size: 18)]),
                       onTap: isFull == true ? (){
                         showToast(context, "Maç dolu !");
                       }:
                       ()async{
                         SharedPreferences preferences = await SharedPreferences.getInstance();
                         int? userId = preferences.getInt("userId");
                         final addUserGameData = await userGameSave(gameListData[index].id, userId!, 1,false);
                         if(addUserGameData!.succes == true){
                           showToast(context, "Oyuna başarıyla kaydolundu !");
                         }
                         else{
                           showToast(context, "Bir hata oluştu !");
                         }
                       },
                     ),
                    );
                   });
                  }
                  else{
                    return circularBasic;
                  }
                }
              }
            ),
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