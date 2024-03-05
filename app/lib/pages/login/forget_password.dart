import 'package:app/%E0%B8%B5utils/api/put_email.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _email = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/tomyumkung.jpg"),
                          fit: BoxFit.cover)),
                )),
                Positioned(
                    top: 280,
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 500,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('Forget password?',
                                        style: GoogleFonts.openSans(
                                            fontSize: 22,
                                            color: Color(0xFF594949),
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('Send Your password to Email',
                                        style: GoogleFonts.openSans(
                                            fontSize: 22,
                                            color: Color(0xFF594949),
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: Container(
                                      width: size.width * 0.8,
                                      height: size.height * 0.08,
                                      child: TextField(
                                        textAlign: TextAlign.left,
                                        controller: _email,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(21)),
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Colors.black,
                                            ),
                                            hintText: 'Email'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColor),
                                          onPressed: () {
                                            
                                            changePassword(_email.text ,context);
                                            _email.text = '';
                                            
                                          },
                                          child: Text(
                                            'Submit',
                                            style: GoogleFonts.openSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ))),
                                ]))))
              ],
            ),
          ),
        ));
  }
}
