import 'package:dio/dio.dart';
import 'package:student_app/interfaces/signup_interface.dart';

class UserSignup extends Signup {
  @override
  void StudentSignup(
      String email,
      String studentName,
      String usn,
      String department,
      String semester,
      String password,
      String password2) async {
    try {
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
