import '../networking/beans/cached_post.dart';
import '../networking/beans/post.dart';
import 'package:realm_dart/realm.dart';

class CacheManager {
  late Realm realm;

  CacheManager() {
    var config = Configuration.local([CachedPost.schema]);
    realm = Realm(config);
  }

  addPosts(List<Post> posts, {bool clear = false}) {
    realm.write(() {
      realm.deleteAll<CachedPost>();
      for (Post post in posts) {
        realm.add(post.toCachedPost());
      }
    });
  }

  List<Post> getPosts() {
    List<Post> posts = List.empty(growable: true);
    var cachedPosts = realm.all<CachedPost>();
    for (CachedPost cachedPost in cachedPosts) {
      posts.add(Post.fromCache(cachedPost));
    }
    return posts;
  }
}
