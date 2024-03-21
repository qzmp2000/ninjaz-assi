import 'package:realm/realm.dart';

part 'cached_post.realm.dart';

@RealmModel()
class _CachedPost {
  @PrimaryKey()
  late String id;
  late String image;
  late int likes;
  late List<String> tags;
  late String text;
  late String publishDate;

  late String ownerId;
  late String ownerTitle;
  late String ownerFirstName;
  late String ownerLastName;
  late String ownerPicture;
}