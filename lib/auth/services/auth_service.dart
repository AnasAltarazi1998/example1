// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:example1/constants/urls.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<dynamic> signInFun({String email, String password}) async {
    if (email == "java@email" && password == "pass") {
      return {
        "id": 1,
        "username": "java",
        "email": "java@email",
        "password": "pass"
      };
    } else
      return "something went wrong";
    // var dio = Dio();
    // final response = await dio.post('$base_auth_url/signin',
    //     data: {'email': email, 'password': password},
    //     options: Options(
    //         contentType: 'application/json;charset=UTF-8',
    //         method: 'POST',
    //         responseType: ResponseType.json));
    // print(response.data);
    // return response.data;
  }
}
