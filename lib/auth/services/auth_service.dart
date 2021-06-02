// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:example1/constants/urls.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<dynamic> signInFun({String email, String password}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    var response = await http.post(
      Uri.parse("$base_auth_url/signin"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email, "password": password}),
    );
    return response.body;
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
