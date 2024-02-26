// ignore_for_file: unnecessary_const

import 'package:app/pages/login/login.dart';
import 'package:app/pages/login/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image(image: AssetImage('assets/food_welcome.png')),
            Text(
              'Welcome to',
              style:
                  GoogleFonts.openSans(fontSize: 40, color: Color(0xFF4E3D3D)),
            ),
            Text(
              'Calculalys',
              style: GoogleFonts.openSans(
                  fontSize: 40,
                  color: Color(0xFF4E3D3D),
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Start control your daily calories.',
              style: GoogleFonts.openSans(
                fontSize: 18,
                color: Color(0xFF4E3D3D),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 258,
              height: 57,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF39200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    print('Go to Next');
                    MaterialPageRoute materialPageRoute = MaterialPageRoute(
                        builder: (BuildContext context) => Login());
                    Navigator.of(context).push(materialPageRoute);
                  },
                  child: Text(
                    'get started',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child:  
              Text(
              'Have an account?',
              style: GoogleFonts.openSans(
                fontSize: 18,
                color: Color(0xFF4E3D3D),
              ),
             ),
             onTap: () {
               Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Register())); 
             },
            )
           
          ],
        ),
      )),
    );
  }
}
