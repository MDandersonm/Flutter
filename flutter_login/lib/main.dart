import 'package:flutter/material.dart';
import 'package:flutter_login/pages/home_page.dart';
import 'package:flutter_login/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            //ButtonStyle로 하면 해야할게 너무많음 기존디자인을 유지하면서 조금 바꿀려면 styleFromd을 쓰자
            backgroundColor: Colors.black,
            primary: Colors.white, //primary:brand 정체성  앱 자체의 기본색상
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            minimumSize: Size(400, 60), //
          ),
        ),
      ),
      initialRoute: "/login", //처음 띄울 화면
      routes: {
        "/login": (context) {
          return LoginPage();
        }, //익명함수도 가능
        "/home": (context) => HomePage()
      },
    );
  }
}
