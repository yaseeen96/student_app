import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_app/models/student_login_model.dart';

abstract class Signup {
  void StudentSignup(
      String email,
      String studentName,
      String usn,
      String department,
      String semester,
      String password,
      String password2) async {
    try {
      // for android use 10.0.2.2/8000
      // for iOS use 127.0.0.1/8000
      const url =
          "https://c08gjwvlm3.execute-api.ap-south-1.amazonaws.com/student/studentapi/student/register/";
      final data = {
        "email": email,
        "studentName": studentName,
        "usn": usn,
        "department": department,
        "semester": semester,
        "password": password,
        "password2": password2,
      };

      final dio = Dio();

      Response response = await dio.post(url, data: data);
    } catch (e) {
      print("Request Error -> ${e}");
    }
  }
}
