
import 'package:app/main_screen.dart';
import 'package:app/pages/add_water.dart';
import 'package:app/pages/home/home.dart';
import 'package:app/pages/login/landing_page.dart';
import 'package:app/pages/login/login.dart';
import 'package:app/pages/login/register.dart';
import 'package:app/pages/statistics.dart';
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
      home: LandingPage(),
    );
  }
}
