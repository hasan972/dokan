import 'dart:convert';
import 'package:dokan/services/dataProvider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Repositoris {
  //================Registration/Sign Up===================//
  Future userRegisterRP(String name, String email, String password) async {
    var returnData;
    try {
      http.Response response =
          await UserDataProvider().userRegisterDP(name, email, password);
      returnData = jsonDecode(response.body);
      if (returnData["code"] == 200) {
        // print(returnData);
        return returnData;
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
    return returnData;
  }

  //================LogIn===================//
  // Future userLoginRP(String name, String password) async {
  //   Map<String, dynamic>? returnDataa;
  //   try {
  //     http.Response response =
  //         await UserDataProvider().userLoginDP(name, password);
  //     // returnDataa = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       returnDataa = jsonDecode(response.body);
  //       // print(type(returnDataa['token']));
  //       // print(returnDataa['token'].runtimeType);
  //       // print(returnDataa);
  //       return returnDataa;
  //     } else {
  //       returnDataa = jsonDecode(response.body);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: const Text(
  //             'Sign Up first!',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           backgroundColor: MyColors().mainColor,
  //           duration: const Duration(seconds: 5),
  //         ),
  //       );
  //     }
  //   } on Exception catch (e) {
  //     throw Exception(e);
  //   }
  //   return returnDataa;
  // }
  Future<Map<String, dynamic>?> userLoginRP(
      BuildContext context, String name, String password) async {
    Map<String, dynamic>? returnDataa;
    try {
      http.Response response =
          await UserDataProvider().userLoginDP(name, password);
      if (response.statusCode == 200) {
        returnDataa = jsonDecode(response.body);
        return returnDataa;
      } else {
        returnDataa = jsonDecode(response.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Wrong username or password."),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                ),
              ],
            );
          },
        );
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
    return returnDataa;
  }
}
