import 'package:dio/dio.dart';
import 'package:student_app/interfaces/login_interface.dart';
import 'package:student_app/models/student_login_model.dart';

class UserLogin extends Login {
  @override
  Future<StudentLoginModel> StudentLogin(
    String email,
    String password,
  ) async {
    try {
      const url =
          "https://c08gjwvlm3.execute-api.ap-south-1.amazonaws.com/student/studentapi/student/login/";
      final data = {
        "email": email,
        "password": password,
      };

      final dio = Dio();

      Response response = await dio.post(url, data: data);

      return StudentLoginModel(
          email: email, token: response.data['token']['access']);
    } catch (e) {
      print("Request Error -> ${e}");
      return StudentLoginModel();
      // return null;
    }
  }
}
