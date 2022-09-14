//pre-defined imports
import 'package:flutter/material.dart';

//user-defined imports
import '../../utils/configurations.dart';
import '../../widgets/custombutton.dart';
import '../user/user_page.dart';
import '../login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          // CSE BOX
          Container(
            margin: EdgeInsets.only(top: deviceHeight * 0.15),
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).highlightColor, width: 4)),
            child: Text(
              "CSE",
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).highlightColor),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.05,
          ),
          Text(
            "Register for Events",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Theme.of(context).highlightColor),
          ),
          SizedBox(
            height: deviceHeight * 0.1,
          ),
          customButton(
            deviceHeight: deviceHeight,
            deviceWidth: deviceWidth,
            text: "Create Account",
          ),
          SizedBox(
            height: deviceHeight * 0.05,
          ),
          customButton(
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
              text: "Login",
              onTap: Navigator.pushNamed(context, "/login")),
        ],
      ),
    );
  }
}
