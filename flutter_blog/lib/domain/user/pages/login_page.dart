import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_from_field.dart';
import 'package:flutter_blog/domain/user/user_controller.dart';

import 'package:flutter_blog/util/validator_util.dart';

import 'package:flutter_blog/domain/post/pages/home_page.dart';
import 'package:get/get.dart';

import '../../../domain/user/pages/join_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                "Sign in", //${u.isLogin}
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: _username,
              hint: "Username",
              funValidator: validateUsername()),
          CustomTextFormField(
              controller: _password,
              hint: "Password",
              funValidator: validatePassword()),
          CustomElevatedButton(
              text: "로그인",
              funPageRoute: () async {
                if (_formKey.currentState!.validate()) {
                  // validate통과 => true
                  // Get.to(HomePage());
                  int result = await u.login(
                      _username.text.trim(), _password.text.trim());
                  if (result ==1) {
                    print("토큰 정상적으로 받음");
                    Get.to(()=>HomePage());
                  }else{
                    print("토큰 못받음");
                    Get.snackbar("로그인 시도", "로그인 실패");//알림창 뜸
                  }
                }
              }),
          TextButton(
              onPressed: () {
                Get.to(JoinPage());
              },
              child: Text("아직 회원가입이 안되어 있나요?"))
        ],
      ),
    );
  }
}
