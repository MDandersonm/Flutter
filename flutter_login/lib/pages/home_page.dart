import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 200),
          Logo("Care Soft"),
          SizedBox(height: 50),
          TextButton(
              onPressed: () {
                Navigator.pop(context);//되돌아가기(Stack에서 pop함
              },
              child: Text("Get Started")),
        ],
      ),
    ));
  }
}
