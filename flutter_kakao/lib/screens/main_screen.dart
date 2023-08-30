import 'package:flutter/material.dart';
import 'package:flutter_kakao/screens/chart_screen.dart';
import 'package:flutter_kakao/screens/friend_screen.dart';
import 'package:flutter_kakao/screens/more_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  //index에 따른 화면전환을 위해 stateful위젯으로함

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FriendScreen(),
          ChatScreen(),
          MoreScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,//이렇게 해줘야 선택된버튼이 파란색으로 변함.
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black,//선택된버튼색
        unselectedItemColor: Colors.black54, // 선택되지 않은색
        onTap: (index) {
          print("선택된 번호: $index ");
          setState(() {
            _selectedIndex = index;
          });

        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: "0",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "1",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsisH),
            label: "2",
          )
        ],
      ),
    );
  }
}
