// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class ProfileRowWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  
  const ProfileRowWidget({
    Key? key, required this.text, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding,right: defaultPadding,top: defaultPadding),
      child: Container(
        height: deviceHeight(context)*0.06,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(119, 119, 119, 0.15),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: Text(text,style: TextStyle(color: Colors.white,fontSize: 18)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: defaultPadding),
          child: icon
        )
      ]),
      
      ),
    );
  }
}