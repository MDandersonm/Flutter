import 'package:flutter/material.dart';

//Stateful 상태가 있는 위젯 => 상태에 따라 위젯이 변경된다.
//ex) 클릭에따라 화면이 바뀐다는말.
class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController; //_가 붙으면 private으로 취급   ?가붙어서 null도 받을 수 있음
  //stateful위젯은 initState라는 생성자가질수있음 단한번만 실행
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    //vsync: this는 애니메이션을 동기화하기 위한 vsync 소스로 현재의 State 객체를 사용함을 나타냄
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.deepPurple,
      // 선택된 탭의 인디케이터 색상
      labelColor: Colors.deepPurple,
      // 선택된 탭의 글자색
      unselectedLabelColor: Colors.grey,
      // 선택되지 않은 탭의 글자색
      labelStyle: TextStyle(
        // 선택된 탭의 글자 스타일
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        // 선택되지 않은 탭의 글자 스타일 (예를 들어)
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      tabs: [
        Tab(text: "갤러리"),
        Tab(text: "타임라인"),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20.0, bottom: 10),
              child: _slectTime(),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://picsum.photos/id/${index + 6}/200/200",
                      scale: 0.1,
                      fit: BoxFit.cover,
                    ),
                  ); //${index + 1}
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20.0, bottom: 10),
              child: _slectTime(),
            ),
            Expanded(
                child: ListView(
              children: [
                _timeLineRow(18, "일요일", "파이널 프로젝트 마무리!"),
                _timeLineRow(19, "월요일", "하브루타 노트 작성하기"),
                _timeLineRow(20, "화요일", "블로그 정리하기"),
                _timeLineRow(21, "수요일", "플러터 라이브러리 공부 및 블로그 정리"),
                _timeLineRow(22, "목요일", "PPT 제작"),
                _timeLineRow(23, "금요일", "TODOFRIENDS 앱 영상 촬영하기"),
                _timeLineRow(24, "토요일", "팀원들이랑 일정 공유하기"),
              ],
            ))
          ],
        )
      ],
    );
  }

  Widget _timeLineRow(int day, String week, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 5, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
            children: [
              Text("$day",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Text("$week", style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // color를 여기로 옮깁니다.
              borderRadius: BorderRadius.circular(10.0), // 모서리 둥글게 설정
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record,
                      size: 8, color: Colors.grey), // 점 아이콘 추가
                  SizedBox(width: 5),
                  Text("$content",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _slectTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "2022년 12월",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5), // 텍스트와 아이콘 사이 간격
        Icon(Icons.keyboard_arrow_down)
      ],
    );
  }
}
