import 'package:assignment/networking/managers/posts_manager.dart';
import 'package:assignment/ui/posts/post.dart';
import 'package:assignment/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:loadmore_listview/loadmore_listview.dart';

import '../../configs/colors.dart';
import '../../networking/beans/post.dart';

class PostsWidget extends StatefulWidget {
  const PostsWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return PostsState();
  }
}

class PostsState extends State<PostsWidget> {
  CacheManager _cacheManager = CacheManager();
  List<Post> _items = List<Post>.empty(growable: true);

  int _page = 1;
  bool _hasMore = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: LoadMoreListView.builder(
            hasMoreItem: _hasMore,
            onLoadMore: () async {
              await _getPosts();
            },
            onRefresh: () async {
              setState(() {
                _page = 1;
                _hasMore = true;
                _getPosts();
              });
            },
            refreshColor: AppColors.secondary,
            refreshBackgroundColor: AppColors.primary,
            loadMoreWidget: Container(
              margin: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: PostWidget(_items[index]));
            }));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _getPosts();
    });
  }

  _getPosts() async {
    PostsManager postsManager = PostsManager();

    await postsManager.getPosts(_page, (int nextPage, int total,
        List<Post>? posts, bool success, String? message) {
      if (!success || posts == null) {
        if (message != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(child: Text(message!))))
              .closed
              .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
        }
        if (_page == 1) {
          setState(() {
            _hasMore = false;
            _items.clear();

            _items.addAll(_cacheManager.getPosts());
          });
        }

        return;
      }

      _cacheManager.addPosts(posts, clear: _page == 1);

      setState(() {
        if (nextPage == 1) {
          _items.clear();
        }

        _items.addAll(posts!);
        _page = nextPage;
        _hasMore = _items.length < total;
      });
    });
  }
}
