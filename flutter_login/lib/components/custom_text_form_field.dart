import 'package:flutter/material.dart';
import 'package:flutter_login/size.dart';
import 'package:validators/validators.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final mValide; //함수.

  const CustomTextFormField({required this.text, required this.mValide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //왼쪽정렬
      children: [
        Text("$text"),
        SizedBox(height: small_gap),
        TextFormField(
          validator: mValide, //함수를 넘겨받아옴.
          obscureText: text == "Password" ? true : false,
          decoration: InputDecoration(
            hintText: "Enter $text",
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
