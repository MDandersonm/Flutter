import 'package:flutter/material.dart';
import 'package:flutter_blog/domain/post/post_controller.dart';
import 'package:flutter_blog/domain/user/pages/login_page.dart';
import 'package:flutter_blog/domain/user/user_controller.dart';
import 'package:flutter_blog/domain/post/post.dart';

import 'package:flutter_blog/size.dart';
import 'package:flutter_blog/domain/post/pages/write_page.dart';

import 'package:flutter_blog/domain/user/pages/user_info.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var scaffoldKey= GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // UserController u = Get.put(UserController());//put:없으면 만들고 있으면 찾기
    UserController u = Get.find(); //find: 만들어져있어야함 put:없으면 만들고 있으면 찾기
//loginpage에서 put해줬었으니까 find쓸수있음.
    //put될때 , 객체 생성(create),onInit함수 실행 ->객체 초기화함(initialize)
    PostController p = Get.put(
        PostController()); //만들고//PostController 인스턴스를 메모리에 생성하고, GetX의 의존성 관리 컨테이너에 추가
    // List <Post> posts = await p.findAll(); //async를 적용못해서 지움

    return Scaffold(
      key:scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(scaffoldKey.currentState!.isDrawerOpen){
            scaffoldKey.currentState!.openEndDrawer();
          }else{
            scaffoldKey.currentState!.openDrawer();

          }
        },
        child: Icon(Icons.code),
      ),
      drawer: _navigation(context),
      appBar: AppBar(title: Text("${u.isLogin}")),
      body: Obx(() => RefreshIndicator(//서버데이터가 갱신된 것을 화면에 새로고침으로 갱신 적용가능
            key: refreshKey,
            onRefresh: () async {
              await p.findAll();
            },
            child: ListView.separated(
              itemCount: p.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    //await를 호출할때도 걸고 함수에도 걸고.
                    await p.findById(p.posts[index].id!); //! : null은 절대아님
                    Get.to(() => DetailPage(p.posts[index].id),
                        arguments: "arguments 속성 테스트");
                  },
                  title: Text("${p.posts[index].title}"),
                  leading: Text("${p.posts[index].id}"),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          )),
    );
  }

  Widget _navigation(BuildContext context) {
    UserController u = Get.find(); //put:없으면 만들고 있으면 찾기
    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //수평축을 왼쪽에붙이기
            children: [
              TextButton(
                onPressed: () {
                  Get.to(()=>WritePage());
                },
                child: Text(
                  "글쓰기",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  // Navigator.pop(context);//제일 위에 쌓여있는것을 날린다.(이게 있어야 뒤로가기했을때 draw창이 안뜬다.)
                  scaffoldKey.currentState!.openEndDrawer();//이렇게 해줄수 있다.
                  Get.to(()=>UserInfo());
                },
                child: Text(
                  "회원정보보기",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  u.logout();
                  Get.to(()=>LoginPage());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
