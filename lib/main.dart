import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:cuhk_treasure_hunt/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //for users to make theme choices later and to make the theme more uniform
      theme: ThemeData(
        primaryColor: Color(0xFF3E8373),
        scaffoldBackgroundColor: Color(0xFFF1F1F1),
//        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline: TextStyle(color: Color(0xFF3E8373), fontSize: 24, fontWeight: FontWeight.w800),
          body1:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}

