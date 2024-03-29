import 'package:app/%E0%B8%B5utils/api/get_food_by_id.dart';
import 'package:app/%E0%B8%B5utils/model/GetFoodById.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/TabStatistic/allStatisticTab.dart';
import 'package:app/pages/TabStatistic/foodStatisticTab.dart';
import 'package:app/pages/TabStatistic/waterSatisticTab.dart';
import 'package:app/pages/foodhistory.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  //late List<dynamic> _food;

  DateTime _selectedDate = DateTime.now();

  final List<Widget> _pages = [
    AllStisticTab(),
    FoodStatisticTab(),
    WaterStatisticTab()
  ];

  int current =0;
  /* Future<void> getFood() async {
    _food = await getFoodById("656f2c960b601921f3a673f3") as List;
    setState(() {
      _isLoad = false;
    });
    print(_food); 
  }
*/
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  /*SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Month',
                            style: GoogleFonts.openSans(
                                fontSize: 22,
                                color: Color(0xFFFFFFFFF),
                                fontWeight: FontWeight.w700))),
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                current = 0;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: current == 0 
                              ? Color(0xFFC47703) : primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text('All',
                                style: GoogleFonts.openSans(
                                    fontSize: 22,
                                    color: Color(0xFFFFFFFFF) ,
                                    fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(
                        
                        child: ElevatedButton(

                            onPressed: () {
                              setState(() {
                                current = 1;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                            
                              backgroundColor:  current == 1 
                              ? Color(0xFFC47703) : primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text('Nutrient',
                                style: GoogleFonts.openSans(
                                    fontSize: 22,
                                    color: Color(0xFFFFFFFFF),
                                    fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                current = 2;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  current == 2 
                              ? Color(0xFFC47703) : primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text('Water',
                                style: GoogleFonts.openSans(
                                    fontSize: 22,
                                    color: Color(0xFFFFFFFFF),
                                    fontWeight: FontWeight.w700))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: _pages[current],
                  ),
                ],
              ),
            )));
  }
}
/*

                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                child: Image(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    image: NetworkImage(
                                        'https://img.wongnai.com/p/1920x0/2020/08/23/db92cec979e14c21804c942a13bea2a2.jpg')),
                              ),
                              SizedBox(
                                width: 10,
                              ),
Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'sdasdasd',
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        color: tertiaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '580',
                                            style: GoogleFonts.openSans(
                                                fontSize: 24,
                                                color: secondaryColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'calories',
                                        style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: quaternaryColor,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              )
*/ 
