import 'package:dio/dio.dart';
import 'package:student_app/interfaces/register_interface.dart';

class UserRegister extends Register {
  @override
  void StudentRegister(String email, String studentName, String usn,
      String department, String semester, String password) async {
    try {
      final url = "";
      final data = {
        "email": email,
        "studentName": studentName,
        "usn": usn,
        "department": department,
        "semester": semester,
        "password": password
      };

      final dio = Dio();

      Response response = await dio.post(url, data: data);
    } catch (e) {
      print("Request Error -> ${e}");
    }
  }
}
