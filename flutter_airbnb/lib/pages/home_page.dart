
import 'package:flutter/material.dart';
import 'package:flutter_airbnb/components/home/home_body.dart';
import 'package:flutter_airbnb/components/home/home_header.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(//화면이 밑으로 흘러내려가야하기떔에 컬럼으로만들지않음
        //ListView는 자식들이 전체크기를 다 잡는다.(width가 꽉찬다 )
        //전체 width에는 SizedBox를 잡아도 안먹힌다. 그래서 Align으로 감싸주면 해결된다.
        //Align을 걸면 Align은 최대넓이로 잡히고 Align의 자식은 최대넓이제한조건이없어진다.
        children: [
          HomeHeader(),//전체 width
          HomeBody(),//전체 width
        ],

      )
    );
  }
}
