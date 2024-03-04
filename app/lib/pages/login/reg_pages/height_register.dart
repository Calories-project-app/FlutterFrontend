import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/login/reg_pages/number_field.dart';
import 'package:app/pages/login/reg_pages/current_weight_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightRegiser extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String birthDate;
  final String gender;

  HeightRegiser(
      {super.key,
      required this.email,
      required this.password,
      required this.name,
      required this.birthDate,
      required this.gender});

  @override
  State<HeightRegiser> createState() => _HeightRegiserState();
}

class _HeightRegiserState extends State<HeightRegiser> {
  final _heigthController = TextEditingController();
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
              'Height?',
              style: GoogleFonts.openSans(
                  fontSize: 36,
                  color: primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: size.width * 0.8,
              child: NumberInputField(
                  label: '',
                  placeholder: 'Enter Height',
                  error: '',
                  isNextable: false,
                  controller: _heigthController),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: primaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => CurrentWeightRegister(email: widget.email, password: widget.password, name: widget.name, birthDate: widget.birthDate ,gender: widget.gender, height : _heigthController.text));
                Navigator.of(context).push(materialPageRoute);
              },
            ),
          ],
        ),
      )),
    );
  }
}
