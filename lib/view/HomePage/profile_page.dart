// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:genc_takim/view/HomePage/widgets/profile_row_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ProfileRowWidget(text: "Uygulama Hakkında",icon: Icon(Icons.photo_album_outlined)),
            ProfileRowWidget(text: "Lisans Bilgileri",icon: Icon(Icons.photo_album_outlined)),
            ProfileRowWidget(text: "Kullanıcı Sözleşmesi",icon: Icon(Icons.photo_album_outlined)),
            ProfileRowWidget(text: "Uygulama Hakkında",icon: Icon(Icons.photo_album_outlined)),
          ],
        )));
  }
}

