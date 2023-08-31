import 'package:validators/validators.dart';

Function validateUsername() {
  return (String? value) {
    //value엔 내가 적었던 값이 들어 온다
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "유저네임은 알파벳또는 숫자만 가능합니다.";
    } else if (value.length > 12) {
      return "유저네임의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "유저네임의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    //value엔 내가 적었던 값이 들어 온다
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    //value엔 내가 적었던 값이 들어 온다
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}
Function validateTitle() {
  return (String? value) {
    //value엔 내가 적었던 값이 들어 온다
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    }else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    //value엔 내가 적었던 값이 들어 온다
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    }else {
      return null;
    }
  };
}