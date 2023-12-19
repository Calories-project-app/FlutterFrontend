import 'package:app/%E0%B8%B5utils/api/get_food_by_id.dart';
import 'package:app/%E0%B8%B5utils/model/GetFoodById.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
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
  late Future<GetFoodById> food;
  Future _loadFood() async {
    food = getFoodById('651c0e7bdc2e3d9c0ff7b6e0');
    print(food);
    print('this is food');
  }

  void initState() {
    _loadFood();
    super.initState();
  }

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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Static'),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Month',
                            style: GoogleFonts.openSans(
                                fontSize: 22,
                                color: Color(0xFFFFFFFFF),
                                fontWeight: FontWeight.w700))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text('All',
                                style: GoogleFonts.openSans(
                                    fontSize: 22,
                                    color: Color(0xFFFFFFFFF),
                                    fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
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
                  Container(
                    child: DatePicker(
                      // prefere calendar_timeline 1.1.2
                      DateTime.now(),
                      height: 100,
                      width: 80,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: primaryColor,
                      selectedTextColor: Colors.white,
                      dateTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: FutureBuilder<GetFoodById>(
                      future: food,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          print('Waiting for data...');
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          print('Error: ${snapshot.error}');
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final foodData = snapshot.data!;
                          print('Food Data Loaded: ${foodData.toJson()}');
                          return ListView.builder(
                            itemCount: foodData.foodHistory?.length ?? 0,
                            itemBuilder: (context, index) {
                              var foodHistory = foodData.foodHistory![index];
                              return Container(
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
                                  elevation:
                                      0, // Set this to 0 to remove Card's default shadow
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        '${foodHistory.imgPath}',
                                      ),
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${foodHistory.foodName ?? "N/A"}'),
                                        SizedBox(height: 5),
                                        Row(children: [
                                          Text(
                                            '${foodHistory.calories ?? "N/A"}',
                                            style: GoogleFonts.openSans(
                                                fontSize: 22,
                                                color: tertiaryColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            ' calories',
                                            style: GoogleFonts.openSans(
                                                fontSize: 12,
                                                color: secondaryColor,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                  // Add other ListTile properties as needed
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
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
