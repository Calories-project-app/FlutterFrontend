import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/login/reg_pages/confirm_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityLevel extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String birthDate;
  final String gender;
  final String height;
  final String weight;
  final String weightGoal;
  const ActivityLevel({
    super.key,
    required this.email,
    required this.password,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.height,
    required this.weight, 
    required this.weightGoal,
  });

  @override
  State<ActivityLevel> createState() => _ActivityLevelState();
}

class _ActivityLevelState extends State<ActivityLevel> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              'How often do you',
              style: GoogleFonts.openSans(
                  fontSize: 36,
                  color: tertiaryColor,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'exercise?',
              style: GoogleFonts.openSans(
                  fontSize: 36,
                  color: primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.8, size.height * 0.02),
                      backgroundColor: Color(0xFFF1F3F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => ConfirmRegister(email: widget.email, password: widget.password, name: widget.name, birthDate: widget.birthDate ,gender: widget.gender, height :widget.height , weight :widget.weight ,weightGoal :widget.weightGoal ,activityLevel : "lightlyActive"));
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Container(
                      width: size.width * 0.7,
                      height: size.height * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '0-1 day a week',
                              style: GoogleFonts.openSans(
                                  fontSize: 22,
                                  color: tertiaryColor,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: size.width * 0.2,
                                  height: size.height * 0.3,
                                  child: Image.asset('assets/Low.png'))),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.8, size.height * 0.02),
                      backgroundColor: Color(0xFFF1F3F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => ConfirmRegister(email: widget.email, password: widget.password, name: widget.name, birthDate: widget.birthDate ,gender: widget.gender, height :widget.height , weight :widget.weight ,weightGoal :widget.weightGoal ,activityLevel : "moderatelyActive"));
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Container(
                      width: size.width * 0.7,
                      height: size.height * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '2-4 day a week',
                              style: GoogleFonts.openSans(
                                  fontSize: 22,
                                  color: tertiaryColor,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: size.width * 0.2,
                                  height: size.height * 0.3,
                                  child: Image.asset('assets/Medium.png'))),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.8, size.height * 0.02),
                      backgroundColor: Color(0xFFF1F3F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => ConfirmRegister(email: widget.email, password: widget.password, name: widget.name, birthDate: widget.birthDate ,gender: widget.gender, height :widget.height , weight :widget.weight ,weightGoal :widget.weightGoal ,activityLevel : "veryActive"));
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Container(
                      width: size.width * 0.7,
                      height: size.height * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '5-7 day a week',
                              style: GoogleFonts.openSans(
                                  fontSize: 22,
                                  color: tertiaryColor,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: size.width * 0.2,
                                  height: size.height * 0.3,
                                  child: Image.asset('assets/High.png'))),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
