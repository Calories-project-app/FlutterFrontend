import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/add_water.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SummaryWater extends StatefulWidget {
  final Map<String, dynamic>? statistics;
  final Map<String, dynamic>? userInfo;
  const SummaryWater({Key? key, this.userInfo, this.statistics})
      : super(key: key);

  @override
  State<SummaryWater> createState() => _SummaryWaterState();
}

class _SummaryWaterState extends State<SummaryWater> {
  @override
  Widget build(BuildContext context) {
    final double percent = widget.statistics != null
        ? (widget.statistics!['totalLitre'] / 1000) /
            widget.userInfo!['waterConsumingRate']
        : 0;
    final String totalLitre = widget.statistics != null
        ? (widget.statistics!['totalLitre'] / 1000).toString()
        : "0";
    final String waterConsumingRate = widget.userInfo != null
        ? (widget.userInfo!['waterConsumingRate'] / 1000).toString()
        : "0";
    final String totalCaffeine = widget.statistics != null
        ? (widget.statistics!['totalCaffeine'] / 1000).toString()
        : "0";
    final double percentCaffeine = widget.statistics != null
        ? (widget.statistics!['totalCaffeine'] / 400)
        : "0";
    final String totalSugar = widget.statistics != null
        ? (widget.statistics!['totalSugar']).toString()
        : "0";
    final double percentSugar = widget.statistics != null
        ? (widget.statistics!['totalSugar'] / 36)
        : "0";
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          height: 250,
          width: 330,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 180,
          width: 330,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(blurRadius: 5.0, offset: Offset(0, 5)),
                BoxShadow(color: Colors.white, offset: Offset(-5, 0))
              ]),
        ),
        Positioned(
            top: 8,
            left: 0,
            child: Container(
              width: 175,
              height: 175,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/water_bottle.png"),
                      fit: BoxFit.cover)),
            )),
        Positioned(
          top: 90,
          left: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearPercentIndicator(
                width: 170,
                lineHeight: 8.0,
                percent: percent > 1 ? 1 : percent,
                barRadius: const Radius.circular(15),
                progressColor: Colors.blue,
                backgroundColor: Colors.grey,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '$totalLitre/$waterConsumingRate',
                        style: GoogleFonts.openSans(
                            fontSize: 19,
                            color: tertiaryColor,
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Liters',
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: greyColor,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const AddWater()));
                  },
                  child: Text(
                    'Add water',
                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700),
                  )),
            ],
          ),
        ),
        Positioned(
          child: Divider(
            color: greyColor,
            indent: 40,
            endIndent: 20,
            height: 150,
            thickness: 2,
          ),
        ),
        Positioned(
            bottom: 20,
            left: 50,
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Caffeine',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    LinearPercentIndicator(
                      width: 130,
                      lineHeight: 8.0,
                      percent: percentCaffeine,
                      barRadius: const Radius.circular(15),
                      progressColor: Colors.brown,
                      backgroundColor: Colors.grey,
                    ),
                    Text(
                      '$totalCaffeine/400 mg',
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: tertiaryColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Sugar',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    LinearPercentIndicator(
                      width: 130,
                      lineHeight: 8.0,
                      percent: percentSugar,
                      barRadius: const Radius.circular(15),
                      progressColor: Colors.redAccent,
                      backgroundColor: Colors.grey,
                    ),
                    Text(
                      '$totalSugar/36 grams',
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: tertiaryColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
/*
child: Divider(
            color: greyColor,
            indent: 30,
            endIndent: 20,
            height: 20,
            thickness: 2,
          ),*/
