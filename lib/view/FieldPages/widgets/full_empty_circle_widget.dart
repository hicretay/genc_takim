// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';
import 'package:genc_takim/settings/functions.dart';

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
            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeNavBarWidget(tabIndex: 0)), (route) => false);
            showToast(context, "Oyun Kaydedildi!");
            Navigator.pop(context);
            Navigator.pop(context);
           });
  }
}