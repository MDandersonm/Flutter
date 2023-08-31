import 'package:flutter/material.dart';

import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_from_field.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import 'login_page.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
              hint: "Password", funValidator: validatePassword()),
          CustomTextFormField(hint: "Email", funValidator: validateEmail()),
          CustomElevatedButton(
              text: "회원가입",
              funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  // validate통과 => true
                  Get.to(LoginPage());
                }
              }),
          TextButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text("로그인 페이지로 이동"))
        ],
      ),
    );
  }
}
