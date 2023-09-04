import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mypage/components/profile_buttons.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ListTile(
          leading: _buildHeaderAvatar(),
          title: _buildHeaderProfile(),
        )),
        ProfileButtons(),
        SizedBox(width: 5,)
      ],
    );
  }

  Widget _buildHeaderAvatar() {
    return SizedBox(
      width: 50,
      height: 50,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/avatar.png"),
      ),
    );
  }

  Widget _buildHeaderProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("김영진",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        Text("반갑습니다. 함께 TODO해요!", style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.grey))
      ],
    );
  }
}
