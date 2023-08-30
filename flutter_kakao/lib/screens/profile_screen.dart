import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/bottom_icon_button.dart';
import 'package:flutter_kakao/components/round_icon_button.dart';
import 'package:flutter_kakao/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          fit: BoxFit.fitHeight, //전체화면 꽉차게, 사진은 짤림
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, //이렇게 해야 배경이미지가 보인다.
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            Spacer(), //여백공간에 스페이서를 주면 맨 아래로 밀어낼 수 있음
            _buildMainStory(),

            user.name == me.name ? _buildMyIcons() : _buildFriendIcons()
          ],
        ),
      ),
    );
  }

  Column _buildMainStory() {
    return Column(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user.backgroundImage),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(user.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 5,
              ),
              Text(user.intro,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  maxLines: 1),
              SizedBox(height: 20),
              Divider(color: Colors.white),
            ],
          );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
          //좌측상단버튼
          icon: Icon(FontAwesomeIcons.times, size: 30, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        //우측상단버튼  //actions는 위젯의 리스트를 받습니다. 따라서 여러 개의 위젯을 순서대로 배열하여 사용할 수 있습니다.
        RoundIconButton(icon: FontAwesomeIcons.gift),
        SizedBox(width: 15),
        RoundIconButton(icon: FontAwesomeIcons.cog),
        SizedBox(width: 20)
      ],
    );
  }

  Widget _buildMyIcons() {
    //리턴타입은 Widget으로 해주는게 좋다
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: "나와의 채팅"),
          SizedBox(width: 50),
          BottomIconButton(icon: FontAwesomeIcons.pen, text: "프로필 편집")
        ],
      ),
    );
  }

  Widget _buildFriendIcons() {
    //리턴타입은 Widget으로 해주는게 좋다
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: "1:1 채팅"),
          SizedBox(width: 50),
          BottomIconButton(icon: FontAwesomeIcons.phone, text: "통화하기")
        ],
      ),
    );
  }
}
