import 'package:flutter/material.dart';
import 'package:student_app/interfaces/register_interface.dart';

import '../../utils/configurations.dart';
import '../signup/signup_page.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../services/register_service.dart';

class SignupPagetwo extends StatelessWidget {
  SignupPagetwo(
      {super.key,
      required this.name,
      required this.usn,
      required this.semester,
      required this.department});

  final TextEditingController name;
  final TextEditingController usn;
  final TextEditingController semester;
  final TextEditingController department;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final Register _register = UserRegister();
  @override
  Widget build(BuildContext context) {
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.08,
            ),
            Text(
              "One last step",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            CustomTextFormField(
              controller: email,
              controllerName: "Email",
            ),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            CustomTextFormField(
              isPassword: true,
              controller: password,
              controllerName: "Password",
            ),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            CustomTextFormField(
              isPassword: true,
              controller: confirmPassword,
              controllerName: "Confirm Password",
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
                          color: Theme.of(context).primaryColor, fontSize: 16),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // print(email.text);
                      _register.StudentRegister(
                          email.text,
                          name.text,
                          usn.text,
                          department.text,
                          semester.text,
                          password.text,
                          confirmPassword.text);
                      Navigator.popAndPushNamed(context, '/');
                    },
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
            ),
          ],
        ),
      ),
    );
  }
}
