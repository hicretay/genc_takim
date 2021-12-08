// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String leading;
  final String labelText;
  final TextEditingController controller;
  

  const TextFormFieldWidget({
    Key? key, required this.leading, required this.labelText, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: maxSpace),
      child: Column(
        children: [
          Padding(
          padding: const EdgeInsets.only(left: defaultPadding,right: defaultPadding),
          child: TextFormField(
          style: TextStyle(color: Colors.white),
          cursorColor: primaryColor,
          controller: controller,
          //validator: (value) => value!.length > 0 ? null : "3 ten küçük olmamalı",
          decoration: InputDecoration(
          fillColor: Colors.amber,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber
            )
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor
            )
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor
            )
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey,fontSize: 16)
             ),
            ),
          ),
        ],
      ),
    );
  }
}