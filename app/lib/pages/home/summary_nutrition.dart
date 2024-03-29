import 'package:app/%E0%B8%B5utils/shared_preference/temp_auth_token.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as intl;

class Summary_Nutrition extends StatelessWidget {
  final Map<String, dynamic>? statistics;
  final Map<String, dynamic>? userInfo;
  const Summary_Nutrition({Key? key, this.userInfo, this.statistics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = intl.DateFormat('d MMM yyyy');
    var percent =
        statistics!['totalCalories'] / userInfo!['totalDailyCalories'];
    print(statistics!['totalCalories']);
    print(userInfo!['totalDailyCalories']);
    print(percent);
    final caloriesLeft =
        userInfo!['totalDailyCalories'] - statistics!['totalCalories'];
    final calPercent =
        ((statistics!['totalCalories'] / userInfo!['totalDailyCalories']) *
            100);
    final waterlitre = userInfo!['waterConsumingRate'] / 1000;
    String formattedDate = formatter.format(now);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formattedDate,
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
                                Icon(
                                  Icons.local_fire_department,
                                  color: Colors.orange,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text:
                                          '${statistics!['totalCalories'].toString()}/${userInfo!['totalDailyCalories'].toString()}',
                                      style: GoogleFonts.openSans(
                                          fontSize: 19,
                                          color: tertiaryColor,
                                          fontWeight: FontWeight.w700),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Cal',
                                          style: GoogleFonts.openSans(
                                              fontSize: 16,
                                              color: tertiaryColor,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ]),
                                ),
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
                                Icon(Icons.water_drop, color: Colors.blue),
                                RichText(
                                  text: TextSpan(
                                      text:
                                          '${(statistics!['totalLitre'] / 1000).toString()}/$waterlitre',
                                      style: GoogleFonts.openSans(
                                          fontSize: 19,
                                          color: tertiaryColor,
                                          fontWeight: FontWeight.w700),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Liters',
                                          style: GoogleFonts.openSans(
                                              fontSize: 16,
                                              color: tertiaryColor,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ]),
                                ),
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
                                radius: 56,
                                lineWidth: 4,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.orange,
                                percent: percent > 1 ? 1 : percent,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      caloriesLeft > 0
                                          ? caloriesLeft.toString()
                                          : "0",
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
                                percent: statistics!['totalProtein'] /
                                    userInfo!['proteinConsumingRate'],
                                barRadius: const Radius.circular(15),
                                progressColor: Colors.purple),
                            Text(
                              '${statistics!['totalProtein'].toString()}/${userInfo!['proteinConsumingRate'].toString()}',
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
                                percent: statistics!['totalCarbohydate'] /
                                    userInfo!['carbConsumingRate'],
                                barRadius: const Radius.circular(15),
                                progressColor: Colors.lightBlue),
                            Text(
                              '${statistics!['totalCarbohydate'].toString()}/${userInfo!['carbConsumingRate'].toString()}',
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
                              percent: statistics!['totalFat'] /
                                  userInfo!['fatConsumingRate'],
                              barRadius: const Radius.circular(15),
                              progressColor: Colors.orange,
                            ),
                            Text(
                              '${statistics!['totalFat'].toString()}/${userInfo!['fatConsumingRate'].toString()}',
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
          )
        ],
      ),
    );
  }
}
