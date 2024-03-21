import '../configs/Configs.dart';

abstract class API{
  static String getPosts = "${Configs.apiUrl}data/v1/post";
}