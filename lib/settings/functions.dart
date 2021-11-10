//-----------------------------------------Toast Mesaj Gösterme Fonksiyonu--------------------------------------------------------
// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genc_takim/settings/constants.dart';

showToast(BuildContext context, String content){
  return  Fluttertoast.showToast(
    msg: content,
    toastLength: Toast.LENGTH_SHORT, 
    gravity: ToastGravity.BOTTOM,
    backgroundColor: secondaryColor,
    textColor: Colors.white,
    timeInSecForIosWeb: 4
  );
}
//----------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------Kullanıcıya Dönüt - Uyarı Dialog Fonksiyonu------------------------------------------------
  showAlert(BuildContext context, String content) { 
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Text(content, style: TextStyle(fontFamily: font)),
        actions: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             MaterialButton(
             color: primaryColor,
             child: Text("Kapat",style: TextStyle(fontFamily: font, color: Colors.white)), 
             onPressed: () async{
               Navigator.of(context).pop();
          }),
          ]),
        ],
      );
    });
  }
//---------------------------------------------------------------------------------------------------------------------------------