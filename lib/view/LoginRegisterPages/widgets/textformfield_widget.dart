// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:genc_takim/settings/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String leading;
  final String labelText;
  

  const TextFormFieldWidget({
    Key? key, required this.leading, required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: maxSpace),
      child: Column(
        children: [
            Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: defaultPadding,left: defaultPadding),
              child: Text(leading,
              textAlign: TextAlign.left,
              style: TextStyle(
              color: Colors.white,
              )),
            ),
          ),
          Padding(
          padding: const EdgeInsets.only(left: defaultPadding,right: defaultPadding),
          child: TextFormField(
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