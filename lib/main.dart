//pre-defined imports
import 'package:flutter/material.dart';

//user-defined imports
import './views/home/home_page.dart';
import './views/login/login_page.dart';
import './views/signup/signup_page.dart';
import './views/user/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF141877),
        highlightColor: Colors.white,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => const LoginPage(),
        '/signup': (context) => SignupPage(),
        '/user': (context) => UserPage(),
      },
    );
  }
}
