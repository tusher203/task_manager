import 'dart:convert';

import 'dart:developer';
import 'package:http/http.dart';
import 'networkResponse.dart';


class NetworkCaller {
  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      Response response = await post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {"Content-type": "Application/json",},);
      log(url);
      log(body.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: jsonDecode(response.body),
          statusCode: 200,
        );
      } else {

        return NetworkResponse(
          isSuccess: false,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {

      return NetworkResponse(isSuccess: false,MessageError: e.toString());
    }
  }
}

