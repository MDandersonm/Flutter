import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    //PostController가 put될떄 실행된다.
    super.onInit();
    print("안녕?");
    findAll();
  } //관찰가능한 변수

  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);
    if (result == 1) {
      print(
          "서버 쪽에서 삭제 성공"); //이상태에서   Get.off(()=> HomePage()); 하면  삭제한거 계속 그대로 보임 갱신이안됨
      List<Post> result =
          posts.where((post) => post.id != id).toList(); //filter기능
      print("result.length :${result.length}");
      posts.value=result;//갱신시킴!
    } else {}
  }

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts; //posts변수에 담긴다. 이를 관찰하는 함수를 만들어서 사용하자
  }

  Future<void> findById(int id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }
}
