import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_detail.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_header.dart';
import 'package:flutter_shoppingcart/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildShoppingCartAppBar(), //_를 붙이면 private 역할 다른곳에서 접근 불가능.
        body: Column(
          children: [
            ShoppingCartHeader(),
            Expanded(child: ShoppingCartDetail()),//밑에까지 화면 꽉차게 expanded걸어줌
          ],
        ));
  }

  AppBar _buildShoppingCartAppBar() => AppBar(
          elevation: 0.0, //그림자 없애기
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                print("클릭됨");
              }),
          actions: [
            IconButton(
                onPressed: () {
                  print("클릭됨");
                },
                icon: Icon(Icons.shopping_cart)),
            SizedBox(
              width: 16.0,
            )
          ]);
}
