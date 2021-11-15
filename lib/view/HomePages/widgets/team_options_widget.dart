import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class TeamOptionsWidget extends StatelessWidget {

  final VoidCallback onTap;
  final ImageProvider iconImage;
  final String leading;

  const TeamOptionsWidget({
    Key? key, required this.onTap, required this.iconImage, required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: deviceWidth(context)*0.46,
        height: deviceHeight(context)*0.2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            width: deviceWidth(context)*0.2,
            height: deviceHeight(context)*0.1,
            decoration: BoxDecoration(image: DecorationImage(image: iconImage))),
            Text(leading,
            style: contentTextStyle,
            )])),
      onTap: onTap,
    );
  }
}