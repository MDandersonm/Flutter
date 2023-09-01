import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get_connect/http/src/response/response.dart';

//통신을 호출해서 응답되는 데이터를 예쁘게 가공 => json => Dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print("loginReqDto.toJson() :${loginReqDto.toJson()}");
    Response response =
        await _userProvider.login(loginReqDto.toJson()); //기다렸다가 데이터가 들어옴
    dynamic headers = response.headers;
    print("response: $response");
    print("response.body: ${response.body}");
    print("response.headers: ${response.headers}");

    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    if (cmRespDto.code == 1) {//이러면 토큰 무조건 받음
      User principal = User.fromJson(cmRespDto.data); //인증정보
      String token = headers["authorization"];
      jwtToken = token;
      print("jwtToken : $jwtToken");
      return principal;
    } else {
      return User(); //빈유저객체
    }

    // if (headers["authorization"] == null) {
    //   return "-1";//null로하면 안된다. Future는 null을 리턴을 못하게되어있다.
    // } else {
    //   String token = headers["authorization"];
    //
    //   return token;
    // }
  }
}
