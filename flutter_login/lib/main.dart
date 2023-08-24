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
      initialRoute: "/login",//처음 띄울 화면
      routes: {
        "/login": (context) {return LoginPage();},//익명함수도 가능 
        "/home": (context) => HomePage()
      },
    );
  }
}
