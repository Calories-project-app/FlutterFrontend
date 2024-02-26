import 'package:app/%E0%B8%B5utils/model/GetFoodById.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/material.dart';
import 'package:app/%E0%B8%B5utils/api/get_food_by_id.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AllStisticTab extends StatefulWidget {
  const AllStisticTab({Key? key}) : super(key: key);

  @override
  State<AllStisticTab> createState() => _AllStisticTabState();
}

class _AllStisticTabState extends State<AllStisticTab> {
  late Future<GetFoodById> foodFuture;

  @override
  void initState() {
    super.initState();
    foodFuture = getFoodById('651c0e7bdc2e3d9c0ff7b6e0');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetFoodById>(
      future: foodFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
                        elevation:
                            0, // Set this to 0 to remove Card's default shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Column(children: [
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    fit: BoxFit.fitHeight,
                                    '${foodHistory.imgPath ?? "https://s.isanook.com/wo/0/ud/36/180929/f.jpg?ip/crop/w670h402/q80/jpg"}'),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${foodHistory.foodName ?? "N/A"}'),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '${foodHistory.calories ?? "N/A"}',
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
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
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
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          )
                        ])));
              },
            );
          }
        },
      );
  }
}
