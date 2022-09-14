import 'package:flutter/material.dart';
import 'package:student_app/utils/configurations.dart';
import 'package:student_app/widgets/custom_text_form_field.dart';

class OTPPage extends StatelessWidget {
  OTPPage({super.key});

  final TextEditingController firstOTP = TextEditingController();
  final TextEditingController secondOTP = TextEditingController();
  final TextEditingController thirdOTP = TextEditingController();
  final TextEditingController fourthOTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: deviceWidth * 0.8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              Text.rich(
                TextSpan(
                  text: "OTP has been sent to",
                  style: TextStyle(
                    fontSize: unitHeightValue * 3,
                  ),
                  children: [
                    TextSpan(
                      text: "\nemail@domain.com",
                      style: TextStyle(
                        fontSize: unitHeightValue * 2,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: deviceHeight * 0.08,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: deviceWidth * 0.8),
                // child: Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     TextFormField(
                //       controller: firstOTP,
                //       decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //       ),
                //     ),
                // TextFormField(
                //   controller: secondOTP,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // TextFormField(
                //   controller: thirdOTP,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // TextFormField(
                //   controller: fourthOTP,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // ],
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
