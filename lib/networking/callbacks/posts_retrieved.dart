import '../beans/post.dart';

typedef PostsRetrieved = Function(int nextPage, int totalItems,
    List<Post>? posts, bool success, String? message);
