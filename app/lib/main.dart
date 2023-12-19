
import 'package:app/pages/home/home.dart';
import 'package:app/pages/login/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const primaryColor = Color(0x00ffffff);

  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: primaryColor),
      home: const LandingPage(),
    );
  }
}
