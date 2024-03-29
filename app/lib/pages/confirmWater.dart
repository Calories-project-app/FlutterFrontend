import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmWater extends StatefulWidget {
  const ConfirmWater({super.key});

  @override
  State<ConfirmWater> createState() => _ConfirmWaterState();
}

class _ConfirmWaterState extends State<ConfirmWater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, -1.75),
              child: Container(
                width: 394,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color(0xFF5AB1EB),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.39, -1.05),
              child: Container(
                width: 160,
                height: 160,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFC0E3FF),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.58, -1.66),
              child: Container(
                width: 160,
                height: 160,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFC0E3FF),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1.05),
              child: Container(
                width: 395,
                height: 643,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 95,
                      width: double.infinity,
                      child: SizedBox(
                          height: 95,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Goal',
                                            style: GoogleFonts.openSans(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: secondaryColor),
                                          ),
                                          Text(
                                            '2000 ml',
                                            style: GoogleFonts.openSans(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF284CCE)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: 120,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Complete',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  color: secondaryColor),
                                            ),
                                            Text(
                                              '1800 ml',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF284CCE)),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.75, -0.85),
                    child: Text(
                      'Water Tracking',
                      style: GoogleFonts.openSans(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.28),
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 200,
                        thumbShape: SliderComponentShape.noOverlay,
                        overlayShape: SliderComponentShape.noOverlay,
                        valueIndicatorShape: SliderComponentShape.noOverlay,
                        trackShape: RectangularSliderTrackShape(),
                      ),
                      child: Container(
                        height: 258,
                        child: Column(
                          children: [
                            Expanded(
                                child: RotatedBox(
                              quarterTurns: 3,
                              child: Slider(
                                value: 10,
                                min: 0,
                                max: 100,
                                activeColor: Colors.blue,
                                inactiveColor: Color(0xFFEFF2FF),
                                
                                onChanged: (double value) {},
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Image.asset('assets/BottleConfirm1.png'),
                  ),
                  Align(
                    alignment:  AlignmentDirectional(-0.4, 0.75),
                    child: ElevatedButton(
                      onPressed:() {
                        
                      },
                      child: Text('Confirm'),
                    ),
                  ),
                  Align(
                    alignment:  AlignmentDirectional(0.4, 0.75),
                    child: ElevatedButton(
                      onPressed:() {
                        
                      },
                      child: Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
