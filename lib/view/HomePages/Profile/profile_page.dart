// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genc_takim/view/HomePages/widgets/profile_row_widget.dart';
import 'package:genc_takim/view/LoginRegisterPages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            ProfileRowWidget(
              text: "Uygulama Hakkında",
              icon: SvgPicture.asset("assets/icons/uygulama_hakkinda.svg",
              height: 25,width: 25),
              onTap: (){},),

            ProfileRowWidget(
              text: "Lisans Bilgileri",
              icon: SvgPicture.asset("assets/icons/lisans_bilgileri.svg",
              height: 25,width: 25),
              onTap: (){},),

            ProfileRowWidget(
              text: "Kullanıcı Sözleşmesi",
              icon: SvgPicture.asset("assets/icons/kullanici_sozlesmesi.svg",
              height: 25,width: 25),
              onTap: (){},),

            ProfileRowWidget(
              text: "Gizlilik Bildirimi",
              icon:SvgPicture.asset("assets/icons/gizlilik_bildirimi.svg",
              height: 25,width: 25),
              onTap: (){},),

            ProfileRowWidget(
              text: "Uygulamadan Çıkış Yap",
              icon:Image.asset("assets/icons/logout.png",
              height: 25,width: 25),
              onTap: () async {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.remove("email");
                preferences.remove("userId");
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const LoginPage()),(route) => false);
              },),
          ],
        )));
  }
}

