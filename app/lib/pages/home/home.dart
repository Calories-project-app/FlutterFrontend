import 'package:app/pages/home/header.dart';
import 'package:app/pages/home/summary_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Hi',
          style: GoogleFonts.openSans(
            fontSize: 38,
            color: Colors.black,
            fontWeight: FontWeight.w700
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(
            Icons.bar_chart_outlined,
            size: 38,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: [Summary_Nutrition()],
        ),
      ),
    );
  }
}
