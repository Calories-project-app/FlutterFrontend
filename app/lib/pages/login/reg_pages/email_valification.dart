import 'dart:ffi';

import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/login/reg_pages/name_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailValification extends StatefulWidget {
  const EmailValification({super.key});

  @override
  State<EmailValification> createState() => _EmailValificationState();
}

class _EmailValificationState extends State<EmailValification> {
  int pin1 = 0;
  int pin2 = 0;
  int pin3 = 0;
  int pin4 = 0;
  int pin5 = 0;
  int pin6 = 0;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Your',
                    style: GoogleFonts.openSans(
                        fontSize: 36,
                        color: tertiaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: Text(
                    'Email',
                    style: GoogleFonts.openSans(
                        fontSize: 36,
                        color: primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: Text(
                    'is',
                    style: GoogleFonts.openSans(
                        fontSize: 36,
                        color: tertiaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                'Example@gmail.com',
                style: GoogleFonts.openSans(
                    fontSize: 36,
                    color: tertiaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Verification Code',
                style: GoogleFonts.openSans(
                    fontSize: 12,
                    color: tertiaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Form(
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 40,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (value) {
                            pin1 = value as int;
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headlineMedium,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 40,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (value) {
                            pin2 = value as int;
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headlineMedium,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 40,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (value) {
                            pin3 = value as int;
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headlineMedium,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 40,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (value) {
                            pin4 = value as int;
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headlineMedium,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 40,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (value) {
                            pin5 = value as int;
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headlineMedium,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 40,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (value) {
                            pin6 = value as int;
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headlineMedium,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 100,),
            GestureDetector(child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                
              ),
              
            ),
           onTap: () {
            MaterialPageRoute materialPageRoute =
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            NameRegister());
              Navigator.of(context).push(materialPageRoute);
            },
            ),
            
          ],
        ),
      ),
    );
  }
}
