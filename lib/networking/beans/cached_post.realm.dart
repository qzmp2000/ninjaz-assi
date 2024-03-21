// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_post.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CachedPost extends _CachedPost
    with RealmEntity, RealmObjectBase, RealmObject {
  CachedPost(
    String id,
    String image,
    int likes,
    String text,
    String publishDate,
    String ownerId,
    String ownerTitle,
    String ownerFirstName,
    String ownerLastName,
    String ownerPicture, {
    Iterable<String> tags = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'likes', likes);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'publishDate', publishDate);
    RealmObjectBase.set(this, 'ownerId', ownerId);
    RealmObjectBase.set(this, 'ownerTitle', ownerTitle);
    RealmObjectBase.set(this, 'ownerFirstName', ownerFirstName);
    RealmObjectBase.set(this, 'ownerLastName', ownerLastName);
    RealmObjectBase.set(this, 'ownerPicture', ownerPicture);
  }

  CachedPost._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  int get likes => RealmObjectBase.get<int>(this, 'likes') as int;
  @override
  set likes(int value) => RealmObjectBase.set(this, 'likes', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  String get publishDate =>
      RealmObjectBase.get<String>(this, 'publishDate') as String;
  @override
  set publishDate(String value) =>
      RealmObjectBase.set(this, 'publishDate', value);

  @override
  String get ownerId => RealmObjectBase.get<String>(this, 'ownerId') as String;
  @override
  set ownerId(String value) => RealmObjectBase.set(this, 'ownerId', value);

  @override
  String get ownerTitle =>
      RealmObjectBase.get<String>(this, 'ownerTitle') as String;
  @override
  set ownerTitle(String value) =>
      RealmObjectBase.set(this, 'ownerTitle', value);

  @override
  String get ownerFirstName =>
      RealmObjectBase.get<String>(this, 'ownerFirstName') as String;
  @override
  set ownerFirstName(String value) =>
      RealmObjectBase.set(this, 'ownerFirstName', value);

  @override
  String get ownerLastName =>
      RealmObjectBase.get<String>(this, 'ownerLastName') as String;
  @override
  set ownerLastName(String value) =>
      RealmObjectBase.set(this, 'ownerLastName', value);

  @override
  String get ownerPicture =>
      RealmObjectBase.get<String>(this, 'ownerPicture') as String;
  @override
  set ownerPicture(String value) =>
      RealmObjectBase.set(this, 'ownerPicture', value);

  @override
  Stream<RealmObjectChanges<CachedPost>> get changes =>
      RealmObjectBase.getChanges<CachedPost>(this);

  @override
  CachedPost freeze() => RealmObjectBase.freezeObject<CachedPost>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'image': image.toEJson(),
      'likes': likes.toEJson(),
      'tags': tags.toEJson(),
      'text': text.toEJson(),
      'publishDate': publishDate.toEJson(),
      'ownerId': ownerId.toEJson(),
      'ownerTitle': ownerTitle.toEJson(),
      'ownerFirstName': ownerFirstName.toEJson(),
      'ownerLastName': ownerLastName.toEJson(),
      'ownerPicture': ownerPicture.toEJson(),
    };
  }

  static EJsonValue _toEJson(CachedPost value) => value.toEJson();
  static CachedPost _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'image': EJsonValue image,
        'likes': EJsonValue likes,
        'tags': EJsonValue tags,
        'text': EJsonValue text,
        'publishDate': EJsonValue publishDate,
        'ownerId': EJsonValue ownerId,
        'ownerTitle': EJsonValue ownerTitle,
        'ownerFirstName': EJsonValue ownerFirstName,
        'ownerLastName': EJsonValue ownerLastName,
        'ownerPicture': EJsonValue ownerPicture,
      } =>
        CachedPost(
          fromEJson(id),
          fromEJson(image),
          fromEJson(likes),
          fromEJson(text),
          fromEJson(publishDate),
          fromEJson(ownerId),
          fromEJson(ownerTitle),
          fromEJson(ownerFirstName),
          fromEJson(ownerLastName),
          fromEJson(ownerPicture),
          tags: fromEJson(tags),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CachedPost._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, CachedPost, 'CachedPost', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('image', RealmPropertyType.string),
      SchemaProperty('likes', RealmPropertyType.int),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('publishDate', RealmPropertyType.string),
      SchemaProperty('ownerId', RealmPropertyType.string),
      SchemaProperty('ownerTitle', RealmPropertyType.string),
      SchemaProperty('ownerFirstName', RealmPropertyType.string),
      SchemaProperty('ownerLastName', RealmPropertyType.string),
      SchemaProperty('ownerPicture', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
