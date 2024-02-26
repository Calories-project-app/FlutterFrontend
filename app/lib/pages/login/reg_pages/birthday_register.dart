import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthdayRegister extends StatefulWidget {
  const BirthdayRegister({super.key});

  @override
  State<BirthdayRegister> createState() => _BirthdayRegisterState();
}

class _BirthdayRegisterState extends State<BirthdayRegister> {
  DateTime dateTime = DateTime.now();

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
              Row(
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
                      'Date of Birth?',
                      style: GoogleFonts.openSans(
                          fontSize: 36,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: quaternaryColor,
                    minimumSize: Size(300, 80) 
                  ),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height *0.3,
                            color: quaternaryColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, 
                                child: Text('Done'), 
                                ), 
                                Expanded(child: buildDatePicker())
                              ],
                            ),
                          );
                        });
                      
                  },
                  child: Text('Enter Date'))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker() => CupertinoDatePicker(
      initialDateTime: dateTime,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (dateTime) =>
          setState(() => this.dateTime = dateTime));


}
