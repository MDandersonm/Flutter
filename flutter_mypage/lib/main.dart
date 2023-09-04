import 'package:flutter/material.dart';
import 'package:flutter_mypage/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/profile_count_info.dart';
import 'components/profile_header.dart';
import 'components/profile_tab.dart';

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

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildProfileAppBar(),
      //NestedScrollView로 바꾸면서 주석처리했음
      // body: Column(//ListView로 바꾸면 오류난다. expanded를 쓰면안되서. 남은공간이 무한인데 무한으로확장하니까.
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            SizedBox(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            NestedScrollView(
              //사진부분만 스크롤되는게아니라 위 의 프로필까지 스크롤 되게 만들어준다.
              headerSliverBuilder: (context, innerBoxIsScrolled) {//innerBoxIsScrolled는 몸통(body) 부분이 스크롤되면 true 값을 가집니다.
                return [
                  SliverList(//SliverList는 일반적인 리스트와는 다르게 슬라이버 기반의 리스트입니다
                      delegate: SliverChildListDelegate([//SliverChildListDelegate를 사용하여 자식들을 정의하고 있습니다.
                    SizedBox(height: 15),
                    ProfileHeader(),
                    SizedBox(height: 15),
                    ProfileCountInfo(),
                  ]))
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ProfileTab(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        //이렇게 해줘야 선택된버튼이 파란색으로 변함.
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.deepPurple,
        //선택된버튼색
        unselectedItemColor: Colors.grey,
        // 선택되지 않은색
        onTap: (index) {
          print("선택된 번호: $index ");
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "채팅",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plusSquare),
            label: "글쓰기",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search),
            label: "검색",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: "MY",
          ),
        ],
      ),
    );
  }

  AppBar _buildProfileAppBar() {
    return AppBar(
        title: Text("마이페이지", style: TextStyle(fontSize: 16)),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none),
              ),
              Positioned(
                right: 8.0,
                top: 8.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
          SizedBox(
            width: 16.0,
          )
        ]);
  }
}
