import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';
import 'package:flutter_login/components/custom_form.dart';
import 'package:flutter_login/components/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        // 타자기가 올라왔을때 스크롤이 가능하게 하기위함.//column으로 하면 오류가남
        children: [
          SizedBox(height: xlarge_gap),
          Logo("Login"),
          SizedBox(height: large_gap),
          CustomForm()
        ],
      ),
    ));
  }
}

