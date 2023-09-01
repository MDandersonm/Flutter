import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

//통신을 호출해서 응답되는 데이터를 예쁘게 가공 => json => Dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print("loginReqDto.toJson() :${loginReqDto.toJson()}");
    Response response =
        await _userProvider.login(loginReqDto.toJson()); //기다렸다가 데이터가 들어옴
    dynamic headers = response.headers;
    print("response: $response");
    print("response.body: ${response.body}");
    print("response.headers: ${response.headers}");

    if (headers["authorization"] == null) {
      return "-1";//null로하면 안된다. Future는 null을 리턴을 못하게되어있다.
    } else {
      String token = headers["authorization"];

      return token;
    }
  }
}
