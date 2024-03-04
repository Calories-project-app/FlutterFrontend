import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/login/reg_pages/height_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderRegister extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String birthDate;

  GenderRegister({super.key ,required this.email , required this.password , required this.name , required this.birthDate});

  @override
  State<GenderRegister> createState() => _GenderRegisterState();
}

class _GenderRegisterState extends State<GenderRegister> {
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
              'What is your',
              style: GoogleFonts.openSans(
                  fontSize: 36,
                  color: tertiaryColor,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Gender?',
              style: GoogleFonts.openSans(
                  fontSize: 36,
                  color: primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.35, size.height * 0.3),
                      backgroundColor: Color(0xFFF1F3F2), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => HeightRegiser(email: widget.email, password: widget.password, name: widget.name, birthDate: widget.birthDate , gender: 'male'));
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Column(
                      children: [
                        Container(
                            width: size.height * 0.1,
                            child: Image.asset('assets/Male.png')),
                        Text(
                          'Male',
                          style: GoogleFonts.openSans(
                              fontSize: 22,
                              color: tertiaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.35, size.height * 0.3),
                      backgroundColor:  Color(0xFFF1F3F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => HeightRegiser(email: widget.email, password: widget.password, name: widget.name, birthDate: widget.birthDate , gender: 'female',));
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Column(
                      children: [
                        Container(
                            width: size.height * 0.1,
                            child: Image.asset('assets/Female.png')),
                        Text(
                          'Female',
                          style: GoogleFonts.openSans(
                              fontSize: 22,
                              color: tertiaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
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
