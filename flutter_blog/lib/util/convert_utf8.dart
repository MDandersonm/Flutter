
import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body){
  //body는 Dart의 Map 객체
  String responseBody = jsonEncode(body);//제이슨형식의 문자열로 변경
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  //UTF8로 디코딩하여 다시 문자열을 Dart객체로 변환
  return convertBody;
}