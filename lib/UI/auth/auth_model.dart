import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_new/data/models/user_model.dart';

class Authcontroller {
  static String? token;
  static userModel? user;

  static Future<void> saveModel(String t, userModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', t);
    sharedPreferences.setString("user", jsonEncode(model.toJson()));
    token = t;
    user = model;
  }
  static Future<void> UpdateProfileModel( userModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("user", jsonEncode(model.toJson()));

    user = model;
  }


  static Future<void> intializeUserCase() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    user = userModel.fromJson(
      jsonDecode(sharedPreferences.getString('user') ?? '{}'),);
  }

  static Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token != null) {
      await intializeUserCase();
      return true;
    }
    return false;
  }

  static Future<void> ClearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    token = null;
  }



}