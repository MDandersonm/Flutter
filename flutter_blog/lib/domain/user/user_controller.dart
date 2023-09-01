import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 =>변수가 변경되면 UI가 자동 업데이트된다.
  final principal =User().obs;
  void logout(){
    this.isLogin.value=false;
    jwtToken=null;
  }

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);
    if (principal.id != null){//정상적으로 객체 받았으면
      this.isLogin.value=true;
      this.principal.value=principal;
      return 1;
    }else{
      return -1;
    }

    // if (token != "-1") {
    //   isLogin.value= true;
    //   jwtToken = token;
    //   print("jwtToken : $jwtToken");
    // }
    // return token;
  }
}
