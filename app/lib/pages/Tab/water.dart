import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/confirmWater.dart';
import 'package:app/pages/login/reg_pages/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaterTab extends StatefulWidget {
  const WaterTab({super.key});

  @override
  State<WaterTab> createState() => _WaterTabTabState();
}

class _WaterTabTabState extends State<WaterTab> {
  Color boxColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ConfirmWater()));
                  },
                  child: Material(
                    child: Ink(
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(blurRadius: 5.0, offset: Offset(0, 2.5)),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Positioned(
                                child: Container(
                              height: 55,
                              width: 20,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/smallbottle.png'),
                                      fit: BoxFit.fill)),
                            )),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              width: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Small',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '350ml',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: quaternaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ConfirmWater()));
                  },
                  child: Material(
                    child: Ink(
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(blurRadius: 5.0, offset: Offset(0, 2.5)),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Positioned(
                                child: Container(
                              height: 55,
                              width: 20,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/mediumbottle.png'),
                                      fit: BoxFit.fill)),
                            )),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              width: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Medium',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '550ml',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: quaternaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ConfirmWater()));
                  },
                  child: Material(
                    child: Ink(
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(blurRadius: 5.0, offset: Offset(0, 2.5)),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Positioned(
                                child: Container(
                              height: 55,
                              width: 20,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/bigbottle.png'),
                                      fit: BoxFit.fill)),
                            )),
                            const SizedBox(
                              width: 50,
                            ),
                            Container(
                              width: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Large',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '1500ml',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 140,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: quaternaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
