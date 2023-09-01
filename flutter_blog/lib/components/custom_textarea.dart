import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funValidator;

  // final String? value;//controller와 value를 동시에 못써서 지움
  final controller;

  const CustomTextArea({
    required this.hint,
    required this.funValidator,
    // this.value,//controller와 value를 동시에 못써서 지움
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        // initialValue: value ,//controller와 value를 동시에 못써서 지움
        controller: controller,
        maxLines: 10,
        validator: funValidator,
        decoration: InputDecoration(
          hintText: "Enter $hint",
          //hint라 하지말고 이렇게 하는게 좋다
          //// null이 되면 오류가나지않고 빈공백이 나온다 그래서 이렇게 넣는게 좋음
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
