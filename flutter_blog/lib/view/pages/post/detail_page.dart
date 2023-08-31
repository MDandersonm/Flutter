import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments;//arguments는 dynamic타입 그래서 받을때 타입을 정해주면됨
    return Scaffold(
      appBar: AppBar(),
      body:
          // Center(
          // child: Text("Detail page $id $data"),//데이터를 넘기는 두가지 방법이있다 생성자로넘기는방법, get.arguments를 쓰는방법
          // child: Text("Detail page $id"),
          // )
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              "글 제목!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            Divider(),
            Row(children: [
              ElevatedButton(onPressed: () {
                // Get.to(HomePage());//객체를 새로만들어서가는거 (상태관리로 갱신이 가능)
                // Get.back();
                Get.off(HomePage());
              }, child: Text("삭제")),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: () {
                Get.to(UpdatePage());
              }, child: Text("수정"))
            ]),

            //SingleChildScrollView는 Expanded로 높이를 줘야 제대로 작동함
            Expanded(child: SingleChildScrollView(child: Text("글 내용!!" * 500))),
        ],
      ),
          ),
    );
  }
}
