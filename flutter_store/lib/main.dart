import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//그림을 그리고싶으면 여기서 그림//안드로이드 그림
      home:Scaffold(
        body:Text("Hello World")

      )//앱의 기본 구조
    );
  }
}
