import 'package:flutter/material.dart';

//primary color: 앱의 브랜드 색상
//secondary(accent color) = 앱의 버튼이나 상효작용하는 이벤트 종류들의 색상

ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.deepPurple, //앱의 브랜드색상
    // accentColor:
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
