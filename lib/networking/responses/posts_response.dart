import '../beans/post.dart';

class PostsResponse{
  int? total;
  int? page;
  int? limit;

  List<Post>? data;

  PostsResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    data = (json['data'] as List<dynamic>).map((e) => Post.fromJson(e)).toList();
  }
}