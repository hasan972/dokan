import 'dart:convert';
import 'package:dokan/services/apiList.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  //============Registration/Sign Up=========//
  Future<http.Response> userRegisterDP(
      String name, String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(ApiList.signUpAPI),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          "username": name,
          "email": email,
          "password": password
        },
      ),
    );
    return response;
  }
  //================LogIn===================//
  Future<http.Response> userLoginDP(
      String name, String password) async {
    http.Response response = await http.post(
      Uri.parse(ApiList.signUpAPI),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          "username": name,
          "password": password
        },
      ),
    );
    return response;
  }

}
