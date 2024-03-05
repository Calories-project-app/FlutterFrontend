import 'dart:async';
import 'dart:convert';
import 'package:app/%E0%B8%B5utils/api/post_water_by_date.dart';
import 'package:app/%E0%B8%B5utils/model/PostWaterByDate.dart';
import 'package:app/%E0%B8%B5utils/sharedPerference.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:intl/intl.dart';

class WaterStatisticTab extends StatefulWidget {
  const WaterStatisticTab({Key? key}) : super(key: key);

  @override
  State<WaterStatisticTab> createState() => _WaterStatisticTabState();
}

DatePickerController _datePickerController = DatePickerController();

class _WaterStatisticTabState extends State<WaterStatisticTab> {
  final _controller = DatePickerController();
  late Future<WaterHistory> waterHistory = Future.value([] as FutureOr<WaterHistory>?);
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchWaterHistory(); // Call fetchWaterHistory when the widget initializes
  }

  void executeAfterBuild() {
    _controller.animateToDate(DateTime.now().subtract(Duration(days: 31)));
  }

  void fetchWaterHistory() async {
    String? _userId = await Shared.getUserId();
    String? userId = _userId;
    String? _token = await Shared.getToken();
    String date = DateFormat('yyyy-MM-dd').format(_selectedDate); // Use selectedDate
    String? token = _token;
    print('This is Select from function $_selectedDate');
    try {
      WaterHistory history =
          await WaterHistoryApi.fetchWaterHistory(userId!, date, token!);
      setState(() {
        waterHistory = Future.value(history);
      });
    } catch (e) {
      print('Error fetching water history: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => executeAfterBuild());
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: size.width * 0.7,
              child: DatePicker(
                DateTime.now().subtract(Duration(days: 31)),
                height: size.height * 0.13,
                width: size.width * 0.15,
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: primaryColor,
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                    fetchWaterHistory();
                    print(_selectedDate);
                  });
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                _controller.animateToDate(_selectedDate);
              },
              child: Container(
                width: size.width * 0.2,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(13)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'To',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Current',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Protein',
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: tertiaryColor,
                      fontWeight: FontWeight.w700),
                ),
                LinearPercentIndicator(
                    lineHeight: 5.0,
                    width: 80,
                    percent: 0.8,
                    barRadius: const Radius.circular(15),
                    progressColor: Colors.purple),
                Text(
                  '15/25 Grams',
                  style: GoogleFonts.openSans(
                      fontSize: 10,
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
                      fontSize: 14,
                      color: tertiaryColor,
                      fontWeight: FontWeight.w700),
                ),
                LinearPercentIndicator(
                    width: 80,
                    lineHeight: 5.0,
                    percent: 0.8,
                    barRadius: const Radius.circular(15),
                    progressColor: Colors.lightBlue),
                Text(
                  '15/25 Grams',
                  style: GoogleFonts.openSans(
                      fontSize: 10,
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
                      fontSize: 14,
                      color: tertiaryColor,
                      fontWeight: FontWeight.w700),
                ),
                LinearPercentIndicator(
                  width: 80,
                  lineHeight: 5.0,
                  percent: 0.8,
                  barRadius: const Radius.circular(15),
                  progressColor: Colors.orange,
                ),
                Text(
                  '15/25 Grams',
                  style: GoogleFonts.openSans(
                      fontSize: 10,
                      color: tertiaryColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            CircularPercentIndicator(
                radius: 40,
                lineWidth: 5,
                backgroundColor: Colors.grey,
                progressColor: Colors.orange,
                percent: 0.6,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      '867',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'calories left',
                      style: GoogleFonts.openSans(
                          fontSize: 10,
                          color: secondaryColor,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ))
          ],
        ),
        Expanded(
          child: Container(
            child: FutureBuilder<WaterHistory>(
              future: waterHistory,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print('This is Error');
                  print(snapshot.error);
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  final WaterHistory? waterHistory = snapshot.data;
                  if (waterHistory == null || waterHistory.waterHistory.isEmpty) {
                    return Center(
                      child: Text('No water history available'),
                    );
                  }
                  return ListView.builder(
                    itemCount: waterHistory.waterHistory.length,
                    itemBuilder: (context, index) {
                      var waterItem = waterHistory.waterHistory[index];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        fit: BoxFit.fitHeight,
                                        '${waterItem.waterName ?? "https://s.isanook.com/wo/0/ud/36/180929/f.jpg?ip/crop/w670h402/q80/jpg"}',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${waterItem.waterName ?? "N/A"}'),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              '${waterItem.calories ?? "N/A"}',
                                              style: GoogleFonts.openSans(
                                                fontSize: 22,
                                                color: tertiaryColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              ' calories',
                                              style: GoogleFonts.openSans(
                                                fontSize: 12,
                                                color: secondaryColor,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Protein',
                                        style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: Colors.purple,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '25 Grams',
                                        style: GoogleFonts.openSans(
                                            fontSize: 10,
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
                                            fontSize: 14,
                                            color: Colors.lightBlue,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '25 Grams',
                                        style: GoogleFonts.openSans(
                                            fontSize: 10,
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
                                            fontSize: 14,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '25 Grams',
                                        style: GoogleFonts.openSans(
                                            fontSize: 10,
                                            color: tertiaryColor,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
