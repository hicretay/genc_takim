import 'package:flutter/material.dart';

class FullEmptyCircleWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? circleIcon;

  const FullEmptyCircleWidget({Key? key, this.onTap, this.circleIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
      maxRadius: 22,
      backgroundColor: Colors.white,
      child: circleIcon ?? const Icon(Icons.help_outline_outlined)),
      onTap: onTap     
    );
  }
}