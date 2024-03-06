import 'dart:convert';
import 'package:app/%E0%B8%B5utils/sharedPerference.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:app/%E0%B8%B5utils/api/post_food_by_date.dart';
import 'package:app/%E0%B8%B5utils/model/PostFoodbyDate.dart';
import 'package:intl/intl.dart';

class FoodStatisticTab extends StatefulWidget {
  //final DateTime selectedDate; // Add selectedDate parameter

  const FoodStatisticTab({Key? key}) : super(key: key);

  @override
  State<FoodStatisticTab> createState() => _FoodStatisticTabState();
}

DatePickerController _datePickerController = DatePickerController();

class _FoodStatisticTabState extends State<FoodStatisticTab> {
  final _controller = DatePickerController();
  late Future<List<FoodItem>> foodHistory = Future.value([]);
  DateTime _selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    fetchFoodHistory(); // Call fetchFoodHistory when the widget initializes
  }

  void executeAfterBuild() {
    _controller.animateToDate(DateTime.now().subtract(Duration(days: 31)));
  }

  void fetchFoodHistory() async {
    String? _userId = await Shared.getUserId();
    String? userId = _userId;
    String? _token = await Shared.getToken();
    String date = DateFormat('yyyy-MM-dd').format(_selectedDate); // Use selectedDate
    String? token = _token;
    print('This is Select from function ${_selectedDate}');
    try {
      List<FoodItem> history =
          await FoodHistoryApi.getFoodHistory(userId!, date, token!);
      setState(() {
        foodHistory = Future.value(
            history); // Set foodHistory Future with the fetched history
      });
    } catch (e) {
      print('Error fetching food history: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => executeAfterBuild());
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: size.width * 0.7,
              child: DatePicker(
                // prefere calendar_timeline 1.1.2
                DateTime.now().subtract(Duration(days: 5)),
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
                    fetchFoodHistory();
                    print(_selectedDate);
                  });
                },
              ),
            ),
            
            Container(
              child: GestureDetector(
                onTap: () {
                     _controller.animateToDate(DateTime.now());
                },
                child: Container(
                  width: size.width * 0.2,
                  height:size.height *0.13,
                  decoration: BoxDecoration(
                    color: primaryColor , 
                    borderRadius: BorderRadius.circular(13)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Go', style: GoogleFonts.openSans(
                        fontSize : 16, 
                        fontWeight : FontWeight.bold, 
                        color : Colors.white
                      ),), 
                      Text( 'To', style: GoogleFonts.openSans(
                        fontSize : 16, 
                        fontWeight : FontWeight.bold, 
                        color : Colors.white),),
                      Text('Current', style: GoogleFonts.openSans(
                        fontSize : 16, 
                        fontWeight : FontWeight.bold, 
                        color : Colors.white),)
                    ],
                  ),
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
            child: FutureBuilder<List<FoodItem>>(
              future: foodHistory,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print('This is Error');
                  print(snapshot.hasError);
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  final List<FoodItem>? foodHistory = snapshot.data;
                  if (foodHistory == null || foodHistory.isEmpty) {
                    return Center(
                      child: Text('No food history available'),
                    );
                  }
                  return ListView.builder(
                    itemCount: foodHistory.length,
                    itemBuilder: (context, index) {
                      var foodItem = foodHistory[index];
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
                                        '${foodItem.imgPath ?? "https://s.isanook.com/wo/0/ud/36/180929/f.jpg?ip/crop/w670h402/q80/jpg"}',
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
                                        Text('${foodItem.foodName ?? "N/A"}'),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              '${foodItem.calories ?? "N/A"}',
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
