import 'package:intl/intl.dart';

class User {
  final int? id;
  final String? username;
  final String? email;
  final DateTime? created;
  final DateTime? updated;

  // User({this.id,
  //   this.username,
  //   this.email,
  //   this.created,
  //   this.updated});
  // this. 키워드는 Dart에서 생성자의 매개변수를 해당 클래스의 멤버 변수에 직접 할당할 때 사용됩니다
  // 위의 표현은 아래와 같다.
  User({int? userId, String? userUsername, String? userEmail, DateTime? userCreated, DateTime? userUpdated})
      : id = userId,
        username = userUsername,
        email = userEmail,
        created = userCreated,
        updated = userUpdated;



  //통신을 위해서 json처럼 생긴 문자열 {"id" :1 }   -> Dart 오브젝트로 변경 필요
  User.fromJson(Map<String, dynamic> json) //User의 명명된 생성자
      : id= json["id"],//초기화 리스트: 생성자 바디가 실행되기 전에 변수를 초기화하는 구문입니다. 콜론 : 뒤에 초기화 코드를 배치하여 초기화 리스트를 정의합니다.
        username =json["username"],
        email=json["email"],
        created=DateFormat("yyyy-mm-dd").parse(json["created"]),
        updated= DateFormat("yyyy-mm-dd").parse(json["updated"]);

}
