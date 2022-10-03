import 'package:flutter/material.dart';
import 'package:order_web_app/screens/home_pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
