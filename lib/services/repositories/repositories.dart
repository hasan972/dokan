import 'dart:convert';
import 'package:dokan/services/dataProvider/data_provider.dart';
import 'package:http/http.dart' as http;

class Repositoris{
  //================Registration/Sign Up===================//
  Future userRegisterRP(
 String name, String email, String password
  )async{
    var returnData;
    try{
      http.Response response = await UserDataProvider().userRegisterDP(name, email, password);
      returnData = jsonDecode(response.body);
      if(returnData["code"] == 200 ){
        return returnData;
      }
    }on Exception catch (e){
      throw Exception(e);
    }
    return returnData;
  }
  //================LogIn===================//
Future userLoginRP(
  String name, String password
  )async{
    var returnData;
    try{
      http.Response response = await UserDataProvider().userLoginDP( name, password);
      returnData = jsonDecode(response.body);
      if(returnData["Status"] == 200 ){
        return returnData;
      }
    }on Exception catch (e){
      throw Exception(e);
    }
    return returnData;
  }
}