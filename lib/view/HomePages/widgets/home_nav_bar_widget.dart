// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, no_logic_in_create_state
//import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePages/Matches/coming_matches_page.dart';
import 'package:genc_takim/view/HomePages/Home/home_page.dart';
import 'package:genc_takim/view/HomePages/Matches/passed_matches_page.dart';
import 'package:genc_takim/view/HomePages/Profile/profile_page.dart';

class HomeNavBarWidget extends StatefulWidget {
  final int tabIndex; 
  //final LoginResponseModel model;
  HomeNavBarWidget({Key? key, required this.tabIndex,}) : super(key: key);

  @override
  _HomeNavBarWidgetState createState() => _HomeNavBarWidgetState(tabIndex: tabIndex);
}

class _HomeNavBarWidgetState extends State<HomeNavBarWidget> {
  int tabIndex;
  _HomeNavBarWidgetState({required this.tabIndex});
  
  //int _currentTab = 0;
  List<Widget> matchesTabItems =[
    const Tab(text: "Yaklaşan Maçlar"),
    const Tab(text: "Geçmiş Maçlar")
  ];

  late final List<Widget> _pages = [HomePage(),const ComingMatchesPage(),const ProfilePage()];
  final List<String> _titles = ["ANASAYFA","MAÇLAR", "PROFİL"];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: tabIndex == 1 ? TabBarView(children: [
             ComingMatchesPage(),
             PassedMatchesPage()
          ]) :
          _pages[tabIndex],
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(           
              backgroundColor: primaryColor,
              centerTitle: true,
              flexibleSpace: 
              tabIndex == 0 || tabIndex == 2 ?
              Container(             
              decoration: tabIndex==0 ? 
              const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                color: primaryColor,
                image: DecorationImage(image: AssetImage("assets/images/balls.jpg"),fit: BoxFit.cover) 
              ): 
              const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                color: primaryColor,
                image: DecorationImage(image: AssetImage("assets/images/sports.jpg"),fit: BoxFit.cover) 
              ),
              child: Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: deviceHeight(context)*0.005),
                        child: Center(
                          child: BorderedText(
                            strokeColor: Colors.black,
                            strokeWidth: 2.0,
                            child: Text(_titles[tabIndex],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                            fontFamily: "RacingSansOne",
                            fontSize: 30, 
                            color: Colors.white))),
                        ),
                      )),
              ):

              Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: deviceHeight(context)*0.005),
                        child: BorderedText(
                          strokeColor: Colors.black,
                          strokeWidth: 2.0,
                          child: Text(_titles[tabIndex],
                          style: const TextStyle(
                            fontFamily: "RacingSansOne",
                            fontSize: 30, 
                            color: Colors.white)),
                        ),
                      )),

            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(20))),
            bottom: tabIndex == 1 ? TabBar(
              padding: EdgeInsets.all(0),
              indicatorColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white, fontFamily:contentFont,fontSize: 23),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: matchesTabItems 
            ) 
            : null,

            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            letIndexChange: (index) => true,
            height: 55,
            backgroundColor: Colors.transparent,
            color: primaryColor,
            buttonBackgroundColor: Colors.white,
            items: const <Widget> [
            Icon(Icons.sports_soccer_outlined, size: 30),
            Icon(Icons.emoji_events_outlined,size: 30,),
            Icon(Icons.person,size: 30)
          ],
            onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
          }),
        ),
      ),
    );
  }
}