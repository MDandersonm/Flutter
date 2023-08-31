import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_from_field.dart';
import 'package:flutter_blog/components/custom_textarea.dart';
import 'package:flutter_blog/pages/post/detail_page.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: ListView(children: [
                CustomTextFormField(
                    hint: "Title", funValidator: validateTitle(), value: "제목1"),
                CustomTextArea(
                    hint: "Content",
                    funValidator: validateContent(),
                    value: "내용1"*20),
                CustomElevatedButton(
                    text: "글 수정하기",
                    funPageRoute: () {
                      if (_formKey.currentState!.validate()) {
                        // validate통과 => true
                        // Get.off(HomePage());
                        // Get.off(DetailPage(1));//뒤로가기못하게 날려버림
                        Get.back();//상태관리 GetX라이브러리- Obs쓰면  back을해도 데이터갱신되게 해줌
                      }
                    })
              ]))),
    );
  }
}
