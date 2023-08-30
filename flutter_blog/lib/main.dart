import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/pages/user/join_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //라우트설계 필요없음 GetX사용할 예정
      home:JoinPage(),

    );
  }
}
