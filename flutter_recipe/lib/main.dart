import 'package:flutter/material.dart';
import 'package:flutter_recipe/pages/recipe_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//디버그표시 제거
      theme:ThemeData(fontFamily: "PatuaOne"),//폰트설정
      home:RecipePage(),
    );
  }
}
