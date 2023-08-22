import 'package:flutter/material.dart';
import 'package:flutter_profile/components/profile_buttons.dart';
import 'package:flutter_profile/components/profile_count_info.dart';
import 'package:flutter_profile/components/profile_drawer.dart';
import 'package:flutter_profile/components/profile_header.dart';
import 'package:flutter_profile/components/profile_tab.dart';
import 'package:flutter_profile/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: ProfileDrawer(),
        appBar: _buildProfileAppBar(),
        //NestedScrollView로 바꾸면서 주석처리했음
        // body: Column(//ListView로 바꾸면 오류난다. expanded를 쓰면안되서. 남은공간이 무한인데 무한으로확장하니까.
        body: NestedScrollView(//사진부분만 스크롤되는게아니라 위 의 프로필까지 스크롤 되게 만들어준다.
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(height: 20),
                ProfileHeader(),
                SizedBox(height: 20),
                ProfileCountInfo(),
                SizedBox(height: 20),
                ProfileButtons(),
              ]))
            ];
          },
          body: ProfileTab(),
//NestedScrollView로 바꾸면서 주석처리
          // children: [
          //   SizedBox(height: 20),
          //   ProfileHeader(),
          //   SizedBox(height: 20),
          //   ProfileCountInfo(),
          //   SizedBox(height: 20),
          //   ProfileButtons(),
          //   Expanded(child: ProfileTab())
          //
          // ],
        ));
  }

  AppBar _buildProfileAppBar() {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios),
      title: Text("Profile"),
      centerTitle: true,
    );
  }
}
