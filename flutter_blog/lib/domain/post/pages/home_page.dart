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
  @override
  Widget build(BuildContext context) {
    // UserController u = Get.put(UserController());//put:없으면 만들고 있으면 찾기
    UserController u = Get.find(); //find: 만들어져있어야함 put:없으면 만들고 있으면 찾기
//loginpage에서 put해줬었으니까 find쓸수있음.
    //put될때 , 객체 생성(create),onInit함수 실행 ->객체 초기화함(initialize)
    PostController p = Get.put(PostController()); //만들고//PostController 인스턴스를 메모리에 생성하고, GetX의 의존성 관리 컨테이너에 추가
    // List <Post> posts = await p.findAll(); //async를 적용못해서 지움

    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(title: Text("${u.isLogin}")),
      body: Obx(() => ListView.separated(
            itemCount: p.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async{//await를 호출할때도 걸고 함수에도 걸고.
                  await p.findById(p.posts[index].id!);//! : null은 절대아님
                  Get.to(()=> DetailPage(p.posts[index].id),
                      arguments: "arguments 속성 테스트");
                },
                title: Text("${p.posts[index].title}"),
                leading: Text("${p.posts[index].id}"),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
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
                  Get.to(WritePage());
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
                  Get.to(UserInfo());
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
                  Get.to(LoginPage());
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
