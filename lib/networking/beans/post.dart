import 'package:assignment/networking/beans/cached_post.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'owner.dart';

class Post {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  Owner? owner;

  Post(this.id, this.image, this.likes, this.tags, this.text, this.publishDate,
      this.owner);

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    likes = json['likes'];
    tags = (json['tags'] as List<dynamic>).map((e) => e as String).toList();
    text = json['text'];
    publishDate = json['publishDate'];
    owner = Owner.fromJson(json['owner']);
  }

  String getRelativeDate() {
    if (publishDate == null) {
      return "";
    }

    var parsedDate = DateTime.parse(publishDate!);
    return timeago.format(parsedDate);
  }

  CachedPost toCachedPost(){
    return CachedPost(id ?? "",
        image ?? "",
        likes ?? 0,
        text ?? "",
        publishDate ?? "",
        owner?.id ?? "",
        owner?.title ?? "",
        owner?.firstName ?? "",
        owner?.lastName ?? "",
        owner?.picture ?? "");
  }

  Post.fromCache(CachedPost cachedPost){
    id = cachedPost.id;
    image = cachedPost.image;
    likes = cachedPost.likes;
    text = cachedPost.text;
    publishDate = cachedPost.publishDate;
    owner = Owner(cachedPost.ownerId, cachedPost.ownerTitle, cachedPost.ownerFirstName, cachedPost.ownerLastName, cachedPost.ownerPicture);
  }
}
