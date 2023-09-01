
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController{
  final PostRepository _postRepository =PostRepository();
  final posts = <Post>[].obs;

  @override
  void onInit() {//PostController가 put될떄 실행된다.
    super.onInit();
    print("안녕?");
    findAll();
  } //관찰가능한 변수


  Future<void> findAll() async{
    List<Post> posts= await _postRepository.findAll();
    this.posts.value =posts;//posts변수에 담긴다. 이를 관찰하는 함수를 만들어서 사용하자




  }
  
}