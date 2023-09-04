import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildFollowButton();
  }

  Widget _buildFollowButton() {
    return TextButton(
        //버튼으로 됨
        onPressed: () {
          print("프로필수정 버튼 클릭됨");
        },
        child: Text(
          "프로필 수정",
          style: TextStyle(color: Colors.grey),
        ),
        style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: Size(100, 40),
            shape: RoundedRectangleBorder(
              // 꼭 기억하기.
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey), //외곽선추가
            )));
  }
}
