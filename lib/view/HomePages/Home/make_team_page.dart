// ignore_for_file: prefer_const_constructors, avoid_renaming_method_parameters, annotate_overrides, hash_and_equals, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genc_takim/model/saloons_list_model.dart';
import 'package:genc_takim/model/sports_list_model.dart';
import 'package:genc_takim/service/game_save_service.dart';
import 'package:genc_takim/service/saloons_list_service.dart';
import 'package:genc_takim/service/sports_list_service.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/settings/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakeTeamPage extends StatefulWidget {
 
  const MakeTeamPage({Key? key}) : super(key: key);

  @override
  _MakeTeamPageState createState() => _MakeTeamPageState();
}

class _MakeTeamPageState extends State<MakeTeamPage> {
  String selectedSport = "Futbol";
  String selectedSaloon = "Konya Büyükşehir Belediyesi Spor Kompleksi";
  int selectedPlayerNumber = 10;
  int selectedSubstituteNumber = 4;
  int selectedSportId = 1;
  int selectedSaloonId = 1;
  bool gameSaved = false;

  TextEditingController teNote = TextEditingController();

  List saloonsListData = [];
  List sportsListData = [];

  DateTime date = DateTime.now();

  Future getSaloonsList() async{
    final SaloonsListModel? saloons = await allSaloonsList();
    setState(() {
      saloonsListData = saloons!.result!;
    });
  }

  Future getSportsList() async{
    final SportsListModel? sports = await allSportsList();
    setState(() {
      sportsListData = sports!.result!;
    });
  }

  @override
  void initState() {
    setState(() {
      getSaloonsList();
      getSportsList();
    });
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Takım Kur",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)))
        ),
        body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.black,
          ),
          child: Container(
        decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
        image: AssetImage("assets/logos/logo.png"))
        ),
        child: ListView(
          children: [
              Column(
              children: [
                 //-----------------------------SPOR SALONU SEÇİMİ---------------------------------------
                  Padding(
                  padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding*2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Spor Salonu Seç",style: TextStyle(color: Colors.white)))),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(defaultPadding, minSpace, defaultPadding, minSpace),
                      child: SizedBox(
                      width: deviceWidth(context),
                      height: deviceHeight(context)*0.05,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(maxSpace)),
                          color: secondaryColor2,
                        ),
                        child:  Align(
                          alignment: Alignment.center,
                          child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  isDense: true,
                                  iconEnabledColor: Colors.white,
                                  iconSize: 30,
                                  dropdownColor: secondaryColor2,
                                  items: saloonsListData.map((e){
                                    return DropdownMenuItem(
                                      child: Center(child: Text(e.saloonName, style: TextStyle(color: Colors.white))),
                                      value: e.saloonName);
                                  }).toList(),
                                  
                                  onChanged: (value) {
                                  setState(() {
                                    selectedSaloon = value.toString();
                                    for (var item in saloonsListData) {
                                          if(item.saloonName == value)
                                          {
                                            selectedSaloonId = item.id;
                                          }
                                        }
                                  });
                                  },
                                  value: selectedSaloon, 
                                  ),
                              ),
                      
                          ),
                        ),
                        ),
                      ),
                    ),

                 //---------------------------------------------------------------------------------------------------

                  //-----------------------------SPOR DALI SEÇİMİ---------------------------------------
                  Padding(
                  padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Spor Dalı Seç",style: TextStyle(color: Colors.white)))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(defaultPadding, minSpace, defaultPadding, minSpace),
                      child: SizedBox(
                        width: deviceWidth(context),
                        height: deviceHeight(context)*0.05,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(maxSpace)),
                              color: secondaryColor2,
                            ),
                          child: Align(
                                alignment: Alignment.center,
                                child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                      isExpanded: true,
                                      isDense: true,
                                      iconEnabledColor: Colors.white,
                                      iconSize: 30,
                                      dropdownColor: secondaryColor2,
                                      items: sportsListData.map((e){
                                        return DropdownMenuItem(
                                          child: Center(child: Text(e.sportName, style: TextStyle(color: Colors.white))),
                                          value: e.sportName);
                                      }).toList(),
                                      
                                      onChanged: (value) {
                                      setState(() {
                                        selectedSport = value.toString();
                                        for (var item in sportsListData) {
                                          if(item.sportName == value)
                                          {
                                            selectedSportId = item.id;
                                          }
                                        }
                                      });
                                      },
                                      value: selectedSport, 
                                      ),
                                    ),
                              ),
                        ),
                      ),
                    ),
                 //---------------------------------------------------------------------------------------------------
        
                //-----------------------------TARİH SEÇİMİ---------------------------------------
                  Padding(
                  padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Tarih Saat Seç",style: TextStyle(color: Colors.white)))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(defaultPadding, minSpace, defaultPadding, minSpace),
                    child: SizedBox(
                    width: deviceWidth(context),
                    height: deviceHeight(context)*0.08,
                    child: Container(
                      color: primaryColor,
                      child: Align(
                        alignment: Alignment.center,
                        child: CupertinoTheme(                    
                          data: CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                            textStyle: TextStyle(color: Colors.white,fontSize: 18))
                          ),
                          child: CupertinoDatePicker(
                            minimumYear: 2021,
                            maximumYear: 2022,
                            backgroundColor: secondaryColor2,
                            mode: CupertinoDatePickerMode.dateAndTime,
                            use24hFormat: true,
                            initialDateTime: DateTime.now(),

                            onDateTimeChanged: (value){
                            setState(() {
                              date = value;
                            });
                          }),
                        )
                      ),
                    ),
                    ),
                  ),
                 //---------------------------------------------------------------------------------------------------
        
               //-----------------------------OYUNCU SAYISI SEÇİMİ---------------------------------------
               
                  Padding(
                  padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Oyuncu Sayısı Seç",style: TextStyle(color: Colors.white)))),
         
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(defaultPadding, minSpace, defaultPadding, minSpace),
                      child: SizedBox(
                      width: deviceWidth(context),
                      height: deviceHeight(context)*0.05,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(maxSpace)),
                          color: secondaryColor2,
                        ),
                        child:  Align(
                          alignment: Alignment.center,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              isExpanded: true,
                              isDense: true,
                              iconEnabledColor: Colors.white,
                              iconSize: 30,
                              dropdownColor: secondaryColor2,
                              value: selectedPlayerNumber,
                              items: [
                                DropdownMenuItem(child: Center(child: Text("10",style: TextStyle(color: Colors.white, fontSize: 14))),value: 10),
                                DropdownMenuItem(child: Center(child: Text("12",style: TextStyle(color: Colors.white, fontSize: 14))),value: 12),
                                DropdownMenuItem(child: Center(child: Text("14",style: TextStyle(color: Colors.white, fontSize: 14))),value: 14),
                              ],
                              onChanged: (value) {
                               setState(() {
                                 selectedPlayerNumber = value!;
                               });
                               },
                              ),
                          ),
                        ),
                        ),
                      ),
                    ),
                  ),
                 //---------------------------------------------------------------------------------------------------
        
               //-----------------------------YEDEK OYUNCU SAYISI SEÇİMİ---------------------------------------
               
                  Padding(
                  padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Yedek Oyuncu Sayısı Seç",style: TextStyle(color: Colors.white)))),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(defaultPadding, minSpace, defaultPadding, minSpace),
                      child: SizedBox(
                      width: deviceWidth(context),
                      height: deviceHeight(context)*0.05,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(maxSpace)),
                          color: secondaryColor2,
                        ),
                        child:  Align(
                          alignment: Alignment.center,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              isExpanded: true,
                              isDense: true,
                              iconEnabledColor: Colors.white,
                              iconSize: 30,
                              dropdownColor: secondaryColor2,
                              value: selectedSubstituteNumber,
                              items: [
                                DropdownMenuItem(child: Center(child: Text("4",style: TextStyle(color: Colors.white, fontSize: 14))),value: 4),
                                DropdownMenuItem(child: Center(child: Text("5",style: TextStyle(color: Colors.white, fontSize: 14))),value: 5),
                                DropdownMenuItem(child: Center(child: Text("6",style: TextStyle(color: Colors.white, fontSize: 14))),value: 6),
                              ],
                              onChanged: (value) {
                              setState(() {
                                selectedSubstituteNumber = value!;
                              });
                              },
                            ),
                          ),
                        ),
                        ),
                      ),
                    ),
                  ),
                 //---------------------------------------------------------------------------------------------------

                 //-----------------------------OYUN KURUCU NOTU---------------------------------------
                  Column(
                  children: 
                  [Padding(
                  padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding,),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Oyun Açıklamasını Giriniz *opsiyonel",style: TextStyle(color: Colors.white)))),
                  Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(defaultPadding, minSpace, defaultPadding, minSpace),
                    child: SizedBox(
                    width: deviceWidth(context),
                    height: deviceHeight(context)*0.1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(maxSpace)),
                        color: secondaryColor2,
                      ),
                      child:  Align(
                        alignment: Alignment.center,
                        child:  TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  controller: teNote,
                                  cursorColor: primaryColor,
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                  ),
                                ),
                        
                      ),
                      ),
                    ),
                  ),
                ),
                    ],
                ),
                  
                 //---------------------------------------------------------------------------------------------------
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
                      child: Text("Oyunu Kaydet",
                      style: TextStyle(
                        fontFamily: font,
                        color: Colors.white,
                        fontSize: 20
                      )),
                      onPressed: () async{
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        int? userId = preferences.getInt("userId");
                        final saveGameData = await gameSave(selectedSportId, userId!, selectedSaloonId, teNote.text, false, date, selectedPlayerNumber, selectedSubstituteNumber);
                        if(saveGameData!.succes == true){
                          showToast(context, "Oyun başarıyla kaydedildi !");
                          setState(() {
                            gameSaved = true;
                          });
                        }
                        else{
                          showToast(context, "Oyun kaydı başarısız !");
                        }
                      }),
                  ),
                ),
                gameSaved == true ?
                SizedBox(
                  width: deviceWidth(context)*0.6,
                  height: deviceHeight(context)*0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    child: Text("Sahadan Konum Seç",
                    style: TextStyle(
                      fontFamily: font,
                      color: Colors.white,
                      fontSize: 20
                    )),
                    onPressed: (){
                      // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => 
                      // selectedSport=="Futbol" ?
                      // FootballFieldPage(numberOfPlayer: selectedPlayerNumber):
                      // selectedSport=="Basketbol" ? BasketballFieldPage() : selectedSport=="Tenis" ? TennisFieldPage() : VolleyballFieldPage()));
                    }),
                ): Container()
              ],
            ),
          ],
        ),
        ),
        )));
  }
}
