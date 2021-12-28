// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:genc_takim/model/user_match_exist_location_model.dart';
import 'package:genc_takim/service/user_match_exist_location_service.dart';
import 'package:genc_takim/service/user_match_save_service.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/settings/functions.dart';
import 'package:genc_takim/view/FieldPages/widgets/full_empty_circle_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VolleyballFieldPage extends StatefulWidget {
  final int? numberOfPlayer;
   final int gameId;

  const VolleyballFieldPage({Key? key, this.numberOfPlayer,required this.gameId}) : super(key: key);

  @override
  _VolleyballFieldPageState createState() => _VolleyballFieldPageState(numberOfPlayer: numberOfPlayer, gameId: gameId);
}

class _VolleyballFieldPageState extends State<VolleyballFieldPage> {
  int? numberOfPlayer;
  int gameId;

  List isLocationFull = [];
  List locations = [];

  _VolleyballFieldPageState({this.numberOfPlayer,required this.gameId});

    Future getIsLocationFull() async{
    final UserMatchExistLocationModel? userLocation = await userMatchIsFull(gameId);
    setState(() {
    isLocationFull = userLocation!.result!;
      for (var item in isLocationFull) {
       if(item.userLocation! != null){
          locations.add(item.userLocation!);
       }
      }
    });
  }

    @override
  void initState() { 
    super.initState();
    setState(() {
      getIsLocationFull();
    });
  }

  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Voleybol Sahası",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: secondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),

      body: Container(
      decoration: BoxDecoration(
       image: DecorationImage(
       image: AssetImage("assets/images/voleybol_sahasi.jpg"),fit: BoxFit.cover)
       ),
       child: Center(
         child: StaggeredGridView.countBuilder(
             staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),    
            itemCount: numberOfPlayer!,
            shrinkWrap: true,
              crossAxisCount : 3,
              mainAxisSpacing: deviceWidth(context) / numberOfPlayer,
              crossAxisSpacing: deviceWidth(context) / (numberOfPlayer!*numberOfPlayer!),
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: EdgeInsets.all(deviceHeight(context)*0.05),
                  child: FullEmptyCircleWidget(
                    onTap: () async{
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      int? userId = preferences.getInt("userId");
                      final addUserGameData = await userGameSave(gameId, userId!, index, false);
                      if(addUserGameData!.succes == true){
                        showToast(context, "Oyuna başarıyla kaydolundu !");
                        Navigator.pop(context);
                      }
                      else{
                        showToast(context, addUserGameData.result.toString());
                      }
                   },
                   circleIcon: locations.isEmpty ? Icon(Icons.check,color: primaryColor) :
                   locations.contains(index) == true ? Icon(Icons.cancel_outlined,color: Colors.red) :  Icon(Icons.check,color: primaryColor), 
                  ),
                );
              }),
       ),
     )
      ));
  }
}