import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(//그림을 그리고싶으면 여기서 그림//안드로이드 그림
  //     home:Scaffold(//앱의 기본구조가 필요 Scaffold라함.
  //       body:Text("Hello World")
  //
  //     )//앱의 기본 구조
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//디버그 띠 없애기
      home:StorePage(),
    );
  }
}

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(//침범하지않게
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text("Woman",style:TextStyle(
                    fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("Kids",style:TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("Shoes",style:TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("Bag",style:TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Image.asset("assets/bag.jpeg", fit: BoxFit.cover,)),
            SizedBox(
              height: 2,
            ),
            Expanded(
                flex: 4,
                child: Image.asset("assets/cloth.jpeg",fit: BoxFit.cover)),
          ],
        ),
      )
    );
  }
}

