import 'package:flutter/material.dart';

class ProfileCountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200], // color를 여기로 옮깁니다.
        borderRadius: BorderRadius.circular(10.0), // 모서리 둥글게 설정
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, //중간중간 Spacer()넣은거랑 똑같음
        children: [
          _buildInfo("150", "팔로잉"),
          _buildLine(),
          _buildInfo("999", "팔로워"),
        ],
      ),
    );
  }

  Widget _buildInfo(String count, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬 설정
      children: [
        Text(title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 2),
        Text(count,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildLine() {
    return Container(color: Colors.grey, width: 1, height: 30);
  }
}
