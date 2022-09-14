import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/models/event_register_model.dart';
import 'package:student_app/services/event_register_service.dart';

//
import '../interfaces/event_register_interface.dart';
import '../models/student_profile_model.dart';

class StudentEventRegister extends EventRegister {
  @override
  Future<EventRegisterModel> EventRegistration(int? eventId) async {
    //GET request for fetching user profile details
    const profileURL =
        "https://c08gjwvlm3.execute-api.ap-south-1.amazonaws.com/student/studentapi/student/profile/";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final dio = Dio();

    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(profileURL);

    StudentProfileModel data;
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      data = StudentProfileModel.fromJson(response.data);
      // return EventRegisterModel();
      const eventRegisterationURL =
          "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/addstudentdetails/";

      // final registartionData = data.toJson();
      final registrationData = {
        "studentEmail": data.email,
        "studentName": data.studentName,
        "usn": data.usn,
        "department": data.department,
        "semester": data.semester,
        "event": eventId,
      };

      EventRegisterModel secondData;
      final eventdio = Dio();
      try {
        Response eventRegistrationResponse =
            await eventdio.post(eventRegisterationURL, data: registrationData);

        secondData =
            EventRegisterModel.fromJson(eventRegistrationResponse.data);
        print("Id :  ${secondData.event!.id}");
        return secondData;
      } on DioError catch (e) {
        if (e.response!.statusCode == 400) {
          print("Error status code 400 : non_field_erros");
          // print("Response ${e.response!.statusCode}\n");
          // print("Error ${e.error}\n");
          // print("message ${e.message}\n");
          // throw Exception();
          return EventRegisterModel();
        } else {
          print("Unkown error");
          throw Exception();
        }
      }
    }

//User details fetched makes a  post request for event registartion

    else {
      // If the server return 400 ,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
