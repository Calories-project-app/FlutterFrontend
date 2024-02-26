import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/login/reg_pages/birthday_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalRegister extends StatefulWidget {
  const GoalRegister({super.key});

  @override
  State<GoalRegister> createState() => _GoalRegisterState();
}

class _GoalRegisterState extends State<GoalRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              decoration:
                  BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
          children: [
            Text(
              'What is your',
              style: GoogleFonts.openSans(
                  fontSize: 36,
                  color: tertiaryColor,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'goal?',
              style: GoogleFonts.openSans(
                  fontSize: 36,
                  color: primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 80), backgroundColor: quaternaryColor
              ),
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => BirthdayRegister());
                Navigator.of(context).push(materialPageRoute);
              }, child: Text(
              'Loss Weight',
              style: GoogleFonts.openSans(
                  fontSize: 22,
                  color: tertiaryColor,
                  fontWeight: FontWeight.w700),
            ),),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 80), backgroundColor: quaternaryColor
              ),
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => BirthdayRegister());
                Navigator.of(context).push(materialPageRoute);
              }, child: Text(
              'Remain Weight',
              style: GoogleFonts.openSans(
                  fontSize: 22,
                  color: tertiaryColor,
                  fontWeight: FontWeight.w700),
            ),),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 80), backgroundColor: quaternaryColor
              ),
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => BirthdayRegister());
                Navigator.of(context).push(materialPageRoute);
              }, child: Text(
              'Gain Weight',
              style: GoogleFonts.openSans(
                  fontSize: 22,
                  color: tertiaryColor,
                  fontWeight: FontWeight.w700),
            ),)
          ],
        ),
        )
        
      ),
    );
  }
}
