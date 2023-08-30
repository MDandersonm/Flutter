import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String hint;

  const CustomTextFormField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "$hint",//hint라 하지말고 이렇게 하는게 좋다
          //// null이 되면 오류가나지않고 빈공백이 나온다 그래서 이렇게 넣는게 좋음
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
