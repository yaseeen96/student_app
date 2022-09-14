import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/interfaces/profile_interface.dart';
import 'package:student_app/models/student_profile_model.dart';

class StudentProfile extends Profile {
  @override
  Future<StudentProfileModel> UserProfile() async {
    // for android use 10.0.2.2/8000
    // for iOS use 127.0.0.1/8000
    final url =
        "https://c08gjwvlm3.execute-api.ap-south-1.amazonaws.com/student/studentapi/student/profile/";

    final dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(url);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    if (response.statusCode == 200) {
      StudentProfileModel data = StudentProfileModel.fromJson(response.data);
      // print(data.department);
      return data;
    } else {
      // If the server return 400 ,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
