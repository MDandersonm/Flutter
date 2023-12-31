import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/dto/CMRespDto.dart';
import 'package:flutter_blog/dto/WriteOrUpdateReqDto.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get_connect/http/src/response/response.dart';

//통신을 호출해서 응답되는 데이터를 예쁘게 가공 => json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<Post> writeBlog(String title, String content) async {
    WriteOrUpdateReqDto writeReqDto = WriteOrUpdateReqDto(title, content);
    Response response =
        await _postProvider.writeBlog(writeReqDto.toJson()); //기다렸다가 데이터가 들어옴
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    if (cmRespDto.code == 1) {
      print("글쓰기 성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      print("글쓰기 실패");
      return Post();
    }
  }

  Future<Post> updateById(int id, String title, String content) async {
    WriteOrUpdateReqDto updateReqDto = WriteOrUpdateReqDto(title, content);
    Response response = await _postProvider.updateById(
        id, updateReqDto.toJson()); //기다렸다가 데이터가 들어옴
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    if (cmRespDto.code == 1) {
      print("수정 성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      print("수정실패");
      return Post();
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    // return cmRespDto.code!;//null이 아님을 ! 로 표현
    return cmRespDto.code ?? -1; //null이면 -1로 처리하란말.
  }

  Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    if (cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll(); //기다렸다가 데이터가 들어옴
    dynamic body = response.body;
    print("response: $response");
    print("response.body: ${response.body}");
    print("response.headers: ${response.headers}");
    print(convertUtf8ToObject(body));
    dynamic convertBody = convertUtf8ToObject(body); //UTF-8한글깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    print("cmRespDto.code: ${cmRespDto.code}");
    print("cmRespDto.msg: ${cmRespDto.msg}");
    print("cmRespDto.data: ${cmRespDto.data}");
    print(
        "cmRespDto.data.runtimeType : ${cmRespDto.data.runtimeType}"); //runtime돌릴떄 타입을 앎

    if (cmRespDto.code == 1) {
      //통신이 성공
      List<dynamic> temp = cmRespDto.data;
      print("temp: ${temp}");
      //통신을 위해서 json처럼 생긴 문자열 {"id" :1 }   -> Dart 오브젝트로 변경 필요
      List<Post> posts = temp.map((e) => Post.fromJson(e)).toList();
      print("posts: ${posts}");
      print("posts.length: ${posts.length}");
      print("posts[0].title: ${posts[0].title}"); //이게된다.
      print("temp[0]: ${temp[0]}"); //temp를 그대로사용하면 안되는 이유?
      // print("temp[0].title: ${temp[0].title}");//이게 안되기 떄문
      return posts;
    } else {
      // List <Post> hello = []; //빈배열
      return <Post>[]; //빈배열을 리턴
    }
  }
}
