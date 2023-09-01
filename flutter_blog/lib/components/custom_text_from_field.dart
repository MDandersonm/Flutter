import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final funValidator;
  // final String? value;//controller와 value를 동시에 못써서 지움
  final controller;

  const CustomTextFormField(
      {required this.hint,
      required this.funValidator,
      // this.value,//controller와 value를 동시에 못써서 지움
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,//null도 받을수있는타입이어서 오류가 안남
        // initialValue: value, //업데이트할때 기본값 받아오려고 씀//controller와 value를 동시에 못써서 지움
        validator: funValidator,
        obscureText: hint == "Password" ? true : false,
        decoration: InputDecoration(
          hintText: "Enter $hint",
          //hint라 하지말고 이렇게 하는게 좋다
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
