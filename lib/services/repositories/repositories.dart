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
        print(returnData);
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
    var returnDataa;
    try{
      http.Response response = await UserDataProvider().userLoginDP( name, password);
      returnDataa = jsonDecode(response.body);
      if(response.statusCode == 200 ){
        // print(type(returnDataa['token']));
        print(returnDataa['token'].runtimeType);
        print(returnDataa);
        return returnDataa;
        
      }
    }on Exception catch (e){
      throw Exception(e);
    }
    return returnDataa;
  }
}