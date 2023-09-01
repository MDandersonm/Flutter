import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_from_field.dart';
import 'package:flutter_blog/components/custom_textarea.dart';
import 'package:flutter_blog/domain/post/post_controller.dart';

import 'package:flutter_blog/util/validator_util.dart';

import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PostController p = Get.find();
    _title.text = "${p.post.value.title}";
    _content.text = "${p.post.value.content}";
    print(_content.text);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: ListView(children: [
                CustomTextFormField(
                  controller: _title,
                  hint: "Title", funValidator: validateTitle(),
                  // value: "${p.post.value.title}",//controller와 value를 동시에 못써서 지움
                ),
                CustomTextArea(
                  controller: _content,
                  hint: "Content",
                  funValidator: validateContent(),
                  // value: "${p.post.value.content}",//controller와 value를 동시에 못써서 지움
                ),
                CustomElevatedButton(
                    text: "글 수정하기",
                    funPageRoute: () async {
                      if (_formKey.currentState!.validate()) {
                        await p.updateById(
                            p.post.value.id ?? 0, _title.text, _content.text);

                        // validate통과 => true
                        // Get.off(HomePage());
                        // Get.off(DetailPage(1));//뒤로가기못하게 날려버림
                        Get.back(); //상태관리 GetX라이브러리- Obs쓰면  back을해도 데이터갱신되게 해줌
                      //수정후 Get.back()해도 데이터가갱신되는이유는 detailPage에서 obx로 post를 관찰하고있기때문이다.
                      }
                    })
              ]))),
    );
  }
}
