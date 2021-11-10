// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, no_logic_in_create_state, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/FieldPages/widgets/full_empty_circle_widget.dart';

class FootballFieldPage extends StatefulWidget {
   final int numberOfPlayer;
  const FootballFieldPage({Key? key, required this.numberOfPlayer}) : super(key: key);

  @override
  _FootballFieldPageState createState() => _FootballFieldPageState(numberOfPlayer: numberOfPlayer);
}

class _FootballFieldPageState extends State<FootballFieldPage> {
   late int numberOfPlayer;

   _FootballFieldPageState({required this.numberOfPlayer});

  @override
  void initState() { 
    super.initState();
    //print(numberOfPlayer);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Futbol Sahası",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: font)),
          backgroundColor: secondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(20)))
        ),

      body: Container(
      decoration: BoxDecoration(
       image: DecorationImage(
      // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
       image: AssetImage("assets/images/futbol_sahasi.jpg"),fit: BoxFit.cover)
       ),
       // ignore: prefer_const_literals_to_create_immutables
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
         Container(child: FullEmptyCircleWidget()),

         Container(child:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: GridView.builder(
            itemCount: numberOfPlayer - 2,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (1 / .4),
              crossAxisCount : 3,
              mainAxisSpacing: defaultPadding*5,
              crossAxisSpacing: defaultPadding,
              ), 
              itemBuilder: (BuildContext context, int index){
                return FullEmptyCircleWidget();
              }),
         )),


          Container(child: FullEmptyCircleWidget())


       
         
       ],),
     )
      ));
  }
}
