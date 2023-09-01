import 'package:get/get.dart';

const host = "http://192.168.25.11:8080";

class UserProvider extends GetConnect {//GetX
  //Promise(데이터 약속 현재는 null인데 조금이따가 데이터로채워줌)
  Future<Response> login(Map data) => post("$host/login", data);
  //
}
