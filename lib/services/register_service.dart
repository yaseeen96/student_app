import 'package:dio/dio.dart';
import 'package:student_app/interfaces/register_interface.dart';

class UserRegister extends Register {
  @override
  void StudentRegister(
      String email,
      String studentName,
      String usn,
      String department,
      String semester,
      String password,
      String password2) async {
    try {
      final url = "http://127.0.0.1:8000/studentapi/student/register/";
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
