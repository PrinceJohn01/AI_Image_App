import 'package:ai_image_app/colors.dart';
import 'package:ai_image_app/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      title: 'AI Image Generator',
      theme: ThemeData(
        fontFamily: 'poppins',
        scaffoldBackgroundColor:bgColor ,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        )),
    );
  }
}
