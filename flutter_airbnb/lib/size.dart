//마진 , 여백 (간격)
import 'package:flutter/cupertino.dart';

const double gap_xl = 40;
const double gap_l = 30;
const double gap_m = 20;
const double gap_s = 10;
const double gap_xs = 5;

const double header_height = 620;

//MediaQuery사용하면 화면 사이즈를 받을 수 있다.
//모니터 화면마다 동적으로 변함
double getBodyWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.7; //화면넓이의 70%
}
