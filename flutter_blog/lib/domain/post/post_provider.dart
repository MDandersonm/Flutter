import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://192.168.25.11:8080";

class PostProvider extends GetConnect {
  //GetX
  //Promise(데이터 약속 현재는 null인데 조금이따가 데이터로채워줌)
  Future<Response> findAll() =>
      get("$host/post", headers: {"Authorization": jwtToken?? ""});//jwtToken이 null이면 공백으로설정
//
  Future<Response> findById(int id) =>
      get("$host/post/$id", headers: {"Authorization": jwtToken?? ""});//jwtToken이 null이면 공백으로설정
//
  Future<Response> deleteById(int id) =>
      delete("$host/post/$id", headers: {"Authorization": jwtToken?? ""});//jwtToken이 null이면 공백으로설정
//
  Future<Response> updateById(int id, Map data) =>
      put("$host/post/$id",data ,headers: {"Authorization": jwtToken?? ""});//jwtToken이 null이면 공백으로설정
//
  Future<Response> writeBlog(Map data) =>
      post("$host/post",data ,headers: {"Authorization": jwtToken?? ""});//jwtToken이 null이면 공백으로설정
//

}
