import 'dart:convert';

import 'package:assignment/networking/api.dart';
import 'package:assignment/networking/managers/api_manager.dart';
import 'package:http/http.dart' as http;

import '../beans/post.dart';
import '../callbacks/posts_retrieved.dart';
import '../parameters.dart';
import '../responses/posts_response.dart';

class PostsManager extends APIManager {
  Future<void> getPosts(int page, PostsRetrieved? callback) async {
    final parameters = {
      Parameters.page: page.toString(),
    };

    final uri = Uri.parse(API.getPosts).replace(queryParameters: parameters);

    int total = 0;
    List<Post>? posts;
    bool success = false;
    String? message = getMessage();
    try {
      final response = await http.get(uri, headers: getDefaultHeaders());
      final body = json.decode(response.body);

      PostsResponse? dataResponse = PostsResponse.fromJson(body);
      total = dataResponse.total ?? 0;
      posts = dataResponse.data;
      success = isSuccess(response: response);
      message = getMessage(response: response);
    } catch (e) {}

    if (callback != null) {
      callback(page + 1, total, posts, success, message);
    }
  }
}
