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
      tabs: [
        Tab(icon: Icon(Icons.directions_car)),
        Tab(icon: Icon(Icons.directions_transit)),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        // GridView(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 3, crossAxisSpacing: 10,mainAxisSpacing: 10),
        //   children: [
        //     Container(color: Colors.yellow),
        //     Container(color: Colors.yellow),
        //     Container(color: Colors.yellow),
        //     Container(color:Colors.yellow),
        //     Container(color:Colors.yellow),
        //     Container(color:Colors.yellow),
        //     Container(color:Colors.yellow),
        //   ],
        // ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Image.network(
                "https://picsum.photos/id/${index + 6}/200/200",scale: 0.1); //${index + 1}
          },
        ),
        Container(color: Colors.red),
      ],
    );
  }
}
