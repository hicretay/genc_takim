import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class FullEmptyCircleWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const FullEmptyCircleWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
           child: const CircleAvatar(
           maxRadius: 22,
           backgroundColor: Colors.white,
           child: Icon(Icons.check,
           color: primaryColor)),
           onTap: onTap     
    );
  }
}