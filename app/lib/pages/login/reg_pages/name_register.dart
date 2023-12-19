import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/login/reg_pages/goal_register.dart';
import 'package:app/pages/login/reg_pages/input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameRegister extends StatefulWidget {
  const NameRegister({super.key});

  @override
  State<NameRegister> createState() => _NameRegisterState();
}

class _NameRegisterState extends State<NameRegister> {
  final _nameController = TextEditingController();
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
          child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'What is your',
                style: GoogleFonts.openSans(
                    fontSize: 36,
                    color: tertiaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Center(
              child: Text(
                'name?',
                style: GoogleFonts.openSans(
                    fontSize: 36,
                    color: primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InputField(
                label: '',
                placeholder: 'Name',
                error: '',
                isNextable: true,
                isPassword: false,
                controller: _nameController),
            SizedBox(height: 100,),
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
                    builder: (BuildContext context) => GoalRegister());
                Navigator.of(context).push(materialPageRoute);
              },
            ),
            
          ],
        ),
      )),
    );
  }
}
