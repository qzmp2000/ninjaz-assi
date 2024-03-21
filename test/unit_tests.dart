import 'package:assignment/networking/managers/posts_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late PostsManager postsManager;

  setUp(() {
    postsManager = PostsManager();
  });

  group('Test Posts Manager', () {
    test('Test getPosts', () async{
      await postsManager.getPosts(1, (nextPage, totalItems, posts, success, message) {
        expect(posts, isNotNull);
        expect(posts?.length, greaterThan(0));
      });
    });

    test('Test pagination', () async{
      await postsManager.getPosts(1, (nextPage, totalItems, posts, success, message) {
        expect(nextPage == 2, true);
      });
    });
  });
}
