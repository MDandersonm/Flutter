import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  final String title;

  const Logo(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      //컬럼은 가운데정렬시켜주는 특징이있다.
      children: [
        SvgPicture.asset("assets/logo.svg", height: 70, width: 70),
        Text(title,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
      ],
    );
  }
}
