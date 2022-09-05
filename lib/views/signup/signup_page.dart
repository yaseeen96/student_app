//pre-defined imports
import 'package:flutter/material.dart';
import 'package:student_app/interfaces/register_interface.dart';
import 'package:student_app/services/register_service.dart';
import 'package:student_app/views/signup/signup_page_two.dart';

//user-defined imports
import '../../views/login/login_page.dart';
import '../../utils/configurations.dart';
import '../../widgets/custom_text_form_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController usn = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController semester = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final Register _register = UserRegister();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.08,
              ),
              Center(
                child: Text(
                  "Fill the below details",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              CustomTextFormField(
                controller: name,
                controllerName: "Name",
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              CustomTextFormField(
                controller: usn,
                controllerName: "USN",
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              CustomTextFormField(
                controller: semester,
                controllerName: "Semester",
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              CustomTextFormField(
                controller: department,
                controllerName: "Department",
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.075),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        "Back",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPagetwo(),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
