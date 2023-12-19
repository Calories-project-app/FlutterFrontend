import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class Summary_Nutrition extends StatelessWidget {
  const Summary_Nutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '19 September 2023',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Detail',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(blurRadius: 5.0, offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0))
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Calories',
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        color: quaternaryColor,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.start,
                                    textDirection: TextDirection.ltr,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.local_fire_department),
                                  Text(
                                    '1119/1200',
                                    style: GoogleFonts.openSans(
                                        fontSize: 22,
                                        color: tertiaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text('cal')
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Water',
                                style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: quaternaryColor,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.ltr,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.water_drop),
                                  Text('1.85/2.13',
                                    style: GoogleFonts.openSans(
                                        fontSize: 22,
                                        color: tertiaryColor,
                                        fontWeight: FontWeight.w700),),
                                  Text('Liters')
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              CircularPercentIndicator(
                                  radius: 60,
                                  lineWidth: 5,
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.orange,
                                  percent: 0.6,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        '867',
                                        style: GoogleFonts.openSans(
                                            fontSize: 24,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'calories left',
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.black,
                        indent: 20,
                        endIndent: 20,
                        height: 20,
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Protein',
                                style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    color: tertiaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              LinearPercentIndicator(
                                  lineHeight: 5.0,
                                  width: 100,
                                  percent: 0.8,
                                  barRadius: const Radius.circular(15),
                                  progressColor: Colors.purple),
                              Text(
                                '15/25 Grams',
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: tertiaryColor,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Carbs',
                                style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    color: tertiaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              LinearPercentIndicator(
                                  width: 100,
                                  lineHeight: 5.0,
                                  percent: 0.8,
                                  barRadius: const Radius.circular(15),
                                  progressColor: Colors.lightBlue),
                              Text(
                                '15/25 Grams',
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: tertiaryColor,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Fat',
                                style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    color: tertiaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              LinearPercentIndicator(
                                width: 100,
                                lineHeight: 5.0,
                                percent: 0.8,
                                barRadius: const Radius.circular(15),
                                progressColor: Colors.orange,
                              ),
                              Text(
                                '15/25 Grams',
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: tertiaryColor,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
