import 'package:flutter/material.dart';
import 'package:flutter_airbnb/constants.dart';
import 'package:flutter_airbnb/size.dart';
import 'package:flutter_airbnb/styles.dart';

class HomeBodyPopularItem extends StatelessWidget {
  final id;
  final popularList = ["p1.jpeg", "p2.jpeg", "p3.jpeg"];

  HomeBodyPopularItem({required this.id});

  @override
  Widget build(BuildContext context) {
    double popularItemWidth = getBodyWidth(context) / 3 - 5;
    print("popularItemWidth $popularItemWidth");
    return Padding(
      padding: const EdgeInsets.only(bottom: gap_xl),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 310,
        ),
        child: SizedBox(
          width: popularItemWidth,
          child: Column(
            children: [
              _buildPopularItemImage(),
              _buildPopularItemStart(),
              _buildPopularItemComment(),
              _buildPopularItemUserInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularItemImage() {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/${popularList[id]}", fit: BoxFit.cover)),
        SizedBox(
          height: gap_s,
        )
      ],
    );
  }

  Widget _buildPopularItemStart() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.star, color: kAccentColor),
            Icon(Icons.star, color: kAccentColor),
            Icon(Icons.star, color: kAccentColor),
            Icon(Icons.star, color: kAccentColor),
            Icon(Icons.star, color: kAccentColor),
          ],
        ),
        SizedBox(
          height: gap_s,
        )
      ],
    );
  }

  Widget _buildPopularItemComment() {
    return Column(
      children: [
        Text(
          "깔끔하고 다 갖춰져 있어서 좋았어요 위치도 완전 좋아요 다들 여기 살고싶다고해요 화장실도 3개에요 5명이서 씼는것도 전혀 불편함없이 좋았어요 이불도 포근하고 좋습니다 ㅎㅎ",
          style: body1(),
          maxLines: 3,
          overflow: TextOverflow.ellipsis, // 끝부분이 ... 으로 됨
        ),
        SizedBox(height: gap_s),
      ],
    );
  }

  Widget _buildPopularItemUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/p1.jpeg"),
        ),
        SizedBox(width: gap_s),
        Column(
          children: [
            Text(
              "데어",
              style: subtitle1(),
            ),
            Text("한국"),
          ],
        )
      ],
    );
  }
}
