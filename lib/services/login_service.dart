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
      final url = "http://127.0.0.1:8000/studentapi/student/login/";
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
