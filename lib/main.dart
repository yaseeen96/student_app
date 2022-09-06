//pre-defined imports
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//user-defined imports
import './views/home/home_page.dart';
import './views/login/login_page.dart';
import './views/signup/signup_page.dart';
import './views/user/user_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");

  print(token);

  runApp(
    MyApp(token: token),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.token});
  final String? token;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: token == null ? LoginPage() : UserPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF141877),
        highlightColor: Colors.white,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/login': (context) => const LoginPage(),
        '/signup': (context) => SignupPage(),
        '/user': (context) => UserPage(),
      },
    );
  }
}
