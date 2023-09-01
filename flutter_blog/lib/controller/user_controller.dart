import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 =>변수가 변경되면 UI가 자동 업데이트된다.

  void logout(){
    isLogin.value=false;
    jwtToken=null;
  }

  Future<String> login(String username, String password) async {
    String token = await _userRepository.login(username, password);

    if (token != "-1") {
      isLogin.value= true;
      jwtToken = token;
      print("jwtToken : $jwtToken");
    }
    return token;
  }
}
