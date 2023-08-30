import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_from_field.dart';

class JoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          //리스트뷰는 Center로 정렬이안됨 sizedBox로 한다.
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(hint: "Enter Username"),
          CustomTextFormField(hint: "Enter Password"),
          CustomTextFormField(hint: "Enter Email"),
          CustomElevatedButton(text: "회원가입")
        ],
      ),
    );
  }
}
