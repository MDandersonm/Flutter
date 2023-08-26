import 'package:flutter/material.dart';
import 'package:flutter_login/components/custom_text_form_field.dart';
import 'package:validators/validators.dart';

import '../size.dart';

class CustomForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      //email과  password를 한번에 전송과 유효성검사를 하기 위함.
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: "Email",
            mValide: (value) {
              print("value:$value");
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              } else if (!isEmail(value)) {
                //이메일이 아니면
                return "이메일 형식이 아닙니다";
              }
              // else if (!isAlphanumeric(value)) {
              //   //알파벳이나 숫자가 아니면
              //   return "이메일에 한글이 들어갈 수 없습니다.";
              // }//골뱅이도 오류처리하는 문제가 생긴다.
              else {
                return null;
              }
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            text: "Password",
            mValide: (value) {
              print("value:$value");
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              } else if (value.toString().length > 20) {
                return "패스워드의 길이를 초과하였습니다. ";
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              //버튼클릭시 작동
              //유효성 검사 성공하면 true리턴 아니면 false리턴
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/home"); //로그인되면 홈화면으로 이동
              }
              _formKey.currentState!.validate(); //기준은 validator를 기준으로 한다.
            },
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
