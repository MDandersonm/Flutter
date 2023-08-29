import 'package:flutter/material.dart';
import 'package:flutter_airbnb/components/home/home_body_banner.dart';
import 'package:flutter_airbnb/components/home/home_body_popular.dart';
import 'package:flutter_airbnb/size.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyWidth= getBodyWidth(context);
    print("bodyWidth : $bodyWidth");
    double screenWidth= MediaQuery.of(context).size.width;

    return Align(//디폴트: 가운데정렬
      child: SizedBox(
        width: screenWidth < 420 ? double.infinity : bodyWidth,// 너비가 420px보다 작으면여백 없애기
        child: Column(
          children: [
            HomeBodyBanner(),
            HomeBodyPopular(),
          ],
        ),
      ),
    );
  }
}
