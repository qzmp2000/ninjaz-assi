import 'package:assignment/configs/configs.dart';
import 'package:assignment/networking/parameters.dart';
import 'package:http/http.dart';
import 'package:assignment/utils/string_helper.dart';
import '../codes.dart';

abstract class APIManager{
  Map<String, String> getDefaultHeaders(){
    return {"Content-Type": "application/json", Parameters.appId : Configs.dummyAppId};
  }

  String? getMessage({Response? response}){
    return isSuccess(response: response) ? localized()?.dataRetrieved : localized()?.checkYourInternetConnect;
  }

  bool isSuccess({Response? response}){
    return response != null ? response.statusCode == ResponseCodes.success : false;
  }
}