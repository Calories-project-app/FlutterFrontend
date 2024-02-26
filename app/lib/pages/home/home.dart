import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/home/header.dart';
import 'package:app/pages/home/sumary_water.dart';
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
        backgroundColor: Colors.white,
        /*actions: <Widget>[
          Icon(
            Icons.bar_chart_outlined,
            size: 38,
            color: Colors.black,
          )
        ],*/
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: 
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
            'Hi Wittawas Donbandit',
            style: GoogleFonts.openSans(
              fontSize: 28,
              color: primaryColor,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(
            height: 10,
          ),
            Summary_Nutrition(),
            SummaryWater(),
            
            ],
          ),
        ),
      ),
    );
  }
}
