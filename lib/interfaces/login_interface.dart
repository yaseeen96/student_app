import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_app/models/student_login_model.dart';

abstract class Login {
  Future<StudentLoginModel> StudentLogin(
    String email,
    String password,
  ) async {
    try {
      // for android use 10.0.2.2/8000
      // for iOS use 127.0.0.1/8000
      const url =
          "https://c08gjwvlm3.execute-api.ap-south-1.amazonaws.com/student/studentapi/student/login/";
      final data = {
        "email": email,
        "password": password,
      };

      final dio = Dio();

      Response response = await dio.post(url, data: data);
      final body = response.data;
      return StudentLoginModel(email: email, token: body['token']);
    } catch (e) {
      print("Login Error $e");
      return StudentLoginModel();
    }
  }
}
