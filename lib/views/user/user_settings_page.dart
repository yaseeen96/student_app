import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:student_app/utils/configurations.dart';
import 'package:student_app/views/login/login_page.dart';
import 'package:student_app/views/user/user_notification_page.dart';
import './user_profile_page.dart';

// import './user_notification_page.dart';
import './user_profile_page.dart';
import './about_page.dart';

class UserSettingsPage extends StatefulWidget {
  UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  var isSwitched = false;
  var darkMode = false;

  void toggleSwitch(bool value) {
    if (isSwitched == true) {
      setState(() {
        isSwitched = false;
        darkMode = false;
      });
    } else {
      setState(() {
        isSwitched = true;
        darkMode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context, true),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),

                // SizedBox(
                //   height: getDeviceHeight(context) * 0.08,
                // ),
                Row(
                  children: [
                    Icon(
                      Icons.dark_mode_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.04,
                    ),
                    Text(
                      "Dark Mode",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.35,
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: Theme.of(context).highlightColor,
                      inactiveThumbColor: Theme.of(context).primaryColor,
                      inactiveTrackColor: Colors.black26,
                      activeTrackColor: Colors.black26,
                    )
                  ],
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.05,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.04,
                    ),
                    Text(
                      "Notification",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.34,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserNotificationPage(),
                        ),
                      ),
                      child: Icon(
                        color: Colors.black26,
                        Icons.keyboard_arrow_right,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.05,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.04,
                    ),
                    Text(
                      "About",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.46,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutPage(),
                        ),
                      ),
                      child: Icon(
                        color: Colors.black26,
                        Icons.keyboard_arrow_right,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.05,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.lock_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.04,
                    ),
                    Text(
                      "Logout",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.44,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Logout"),
                            content: Text(
                              "Are you sure?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.remove("token");
                                  Navigator.popAndPushNamed(context, "/login");
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      child: Icon(
                        color: Colors.black26,
                        Icons.keyboard_arrow_right,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            maxHeight: getDeviceHeight(context),
            minHeight: getDeviceHeight(context) * 0.3,
            panel: Container(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(80)),
                    ),
                    SizedBox(
                      height: getDeviceHeight(context) * 0.028,
                    ),
                    Text(
                      "Yaseen Mar khayega",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                width: getDeviceWidth(context),

                // height: getDeviceHeight(context),
                color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
