// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/view/HomePage/home_nav_bar_widget.dart';

class FullEmptyCircleWidget extends StatelessWidget {
  const FullEmptyCircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
           child: CircleAvatar(
           maxRadius: 22,
           backgroundColor: Colors.white,
           child: Icon(Icons.check,
           color: primaryColor)),
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeNavBarWidget(tabIndex: 1)));
           });
  }
}