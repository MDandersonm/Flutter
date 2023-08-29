import 'package:flutter/material.dart';
import 'package:flutter_airbnb/components/home/home_header_appbar.dart';
import 'package:flutter_airbnb/components/home/home_header_form.dart';
import 'package:flutter_airbnb/size.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //container에 size가 있어야 그림이 나온다.
        height: header_height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover)),//이미지 화면 꽉채우기
        child: Column(
          children: [
            HomeHeaderAppBar(),
            HomeHeaderForm(),
          ],
        ));
  }
}
