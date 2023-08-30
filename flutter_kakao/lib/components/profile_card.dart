import 'package:flutter/material.dart';
import 'package:flutter_kakao/models/user.dart';
import 'package:flutter_kakao/screens/profile_screen.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 내용물을 버튼화
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileScreen(user: user)));
      }, //버튼을 눌렀을때 작동
      child: ListTile(
        leading: CircleAvatar(
          radius: 20, //크기
          backgroundImage: NetworkImage(user.backgroundImage),
        ),
        title: Text(user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(user.intro, style: TextStyle(fontSize: 12)),
        // contentPadding: EdgeInsets.all(0), //패딩값 없애기
      ),
    );
  }
}
