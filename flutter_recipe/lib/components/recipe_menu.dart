import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      // child: SingleChildScrollView(//자기자식에 스크롤 세로방향으로
      //     scrollDirection: Axis.horizontal,
      child: Row(
        //ListView로 바꿔서 스크롤 하게 바꾸는 게 좋음
        children: [
          _buildMenuItem(Icons.food_bank, "ALL"),
          SizedBox(width: 25),
          _buildMenuItem(Icons.emoji_food_beverage, "Coffee"),
          SizedBox(width: 25),
          _buildMenuItem(Icons.fastfood, "Burger"),
          SizedBox(width: 25),
          _buildMenuItem(Icons.local_pizza, "Pizza"),
          // SizedBox(width: 25),
          // _buildMenuItem(Icons.local_pizza, "Pizza"),
          //컨테이너는 자식의 크기에맞게 조절된다.
        ],
      ),
      // ),
    );
  }

  Container _buildMenuItem(IconData mIcon, String text) {
    return Container(
      // color: Colors.red,
      width: 60,
      height: 80,
      decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(30)),
      // Decoration 추상클래스는 객체를 만들 수 없다. 구현체는 BoxDecoration
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            mIcon,
            color: Colors.redAccent,
            size: 30,
          ),
          SizedBox(
            height: 5,
          ),
          Text(text)
        ],
      ), //컨테이너는 자식을 하나만 가질수있다
    );
  }
}
