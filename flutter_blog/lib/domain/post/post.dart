import 'package:flutter_blog/domain/user/user.dart';
import 'package:intl/intl.dart';

class Post {
  final int? id;
  final String? title;
  final String? content;
  final User? user;
  final DateTime? created;
  final DateTime? updated;

  Post({this.id,
    this.title,
    this.content,
    this.user,
    this.created,
    this.updated});

  //통신을 위해서 json처럼 생긴 문자열 {"id" :1 }   -> Dart 오브젝트로 변경 필요
  //외부에서 넘어온 json 데이터를 post 객체에 넣는다.
  Post.fromJson(Map<String, dynamic> json)//명명된 생성자
      : id= json["id"],
        title =json["title"],
        content=json["content"],
        user= User.fromJson(json["user"]),
        created=DateFormat("yyyy-mm-dd").parse(json["created"]),
        updated= DateFormat("yyyy-mm-dd").parse(json["updated"]);


}
