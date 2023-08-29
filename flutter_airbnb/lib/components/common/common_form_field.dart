import 'package:flutter/material.dart';
import 'package:flutter_airbnb/styles.dart';

class CommonFormField extends StatelessWidget {
  final prefixText;
  final hintText;

  const CommonFormField({required this.prefixText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          //hintext를 밑으로 내려줌  contentPadding: EdgeInsets.only 으로 여백을 만들어줘야 작동한다.
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
              //밑으로 여백을 만들어줌
              hintText: hintText,
              //미리써놓여진 글
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                  //포커스됐을때 파란색테두리 없애기
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    //포커스 주면 진해지게
                    color: Colors.black,
                    width: 2,
                  ))),
        ),
        Positioned(
            top: 8,
            left: 20,
            child: Text(
              prefixText,
              style: overLine(),
            )),
      ],
    );
  }
}
