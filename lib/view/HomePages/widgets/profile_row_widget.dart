// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class ProfileRowWidget extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onTap;
  
  const ProfileRowWidget({
    Key? key, required this.text, required this.icon, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding,right: defaultPadding,top: defaultPadding),
      child: GestureDetector(
        child: Container(
          height: deviceHeight(context)*0.06,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(maxSpace))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Text(text,style: TextStyle(color: Colors.white,fontSize: 21,fontFamily: contentFont)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding),
            child: icon
          )
        ]),
        ),
        onTap: onTap,
      ),
    );
  }
}