import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:task_manager_new/UI/UI_Screens/login_screen.dart';
import 'package:task_manager_new/UI/auth/auth_model.dart';
import 'package:task_manager_new/app.dart';

import 'network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body, bool isLogin = false}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          "Content-type": "Application/json",
          'token': Authcontroller.token.toString(),
        },
      );
      log(response.headers.toString());
      log(url);
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statusCode: 200);
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          BackToLogin();
        }

        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> getRequest(
  String url,

  ) async {
    try {
      log(url);
      Response response = await get(
        Uri.parse(url),
        headers: {
          "Content-type": "Application/json",
          'token': Authcontroller.token.toString(),
        },
      );
      log(response.headers.toString());
      log(url);
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statusCode: 200);
      } else if (response.statusCode == 401) {
        BackToLogin();

        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<void> BackToLogin() async {
    await Authcontroller.ClearData();

    Navigator.pushAndRemoveUntil(
        TaskManagerApp.NavigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
