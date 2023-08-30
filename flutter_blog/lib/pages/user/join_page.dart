import 'package:flutter/material.dart';
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
            SizedBox(height: 200),
            CustomTextFormField(),
          ],
        ),
      ),
    );
  }
}

