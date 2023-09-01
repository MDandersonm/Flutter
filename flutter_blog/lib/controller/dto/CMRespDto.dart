import 'package:intl/intl.dart';

class CMRespDto {

  final int? code;
  final String? msg;
  final dynamic data;

  CMRespDto({this.code,
    this.msg,
    this.data,
});


  //통신을 위해서 json처럼 생긴 문자열 {"id" :1 }   -> Dart 오브젝트로 변경 필요
  CMRespDto.fromJson(Map<String, dynamic> json)
      : code= json["code"],
  //초기화 리스트: 생성자 바디가 실행되기 전에 변수를 초기화하는 구문입니다. 콜론 : 뒤에 초기화 코드를 배치하여 초기화 리스트를 정의합니다.
        msg =json["msg"],
        data=json["data"];

}
