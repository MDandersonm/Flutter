import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/profile_card.dart';
import 'package:flutter_kakao/models/user.dart';

class FriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("친구")),
        body: Column(
          children: [
            SizedBox(height: 10),
            ProfileCard(user: me),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text("친구"),
                  SizedBox(width: 6),
                  Text("${friends.length}"),
                ],
              ),
            ),
            Expanded(//ListView가 높이가 없기때문에 꼭 이것을 해줘야함
              child: ListView(
                children: List.generate(friends.length, (index) => ProfileCard(user: friends[index])),
              ),
            )
          ],
        ));
  }
}
