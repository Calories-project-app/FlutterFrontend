import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/Tab/coffeeTab.dart';
import 'package:app/pages/Tab/colaTab.dart';
import 'package:app/pages/Tab/teaTab.dart';
import 'package:app/pages/Tab/water.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWater extends StatefulWidget {
  const AddWater({super.key});

  @override
  State<AddWater> createState() => _AddWaterState();
}

class _AddWaterState extends State<AddWater> {
  Map<String, String> waterTypes = {
    "Water": "assets/istockphoto-1333490708-612x612.png",
    "Coffee": "assets/coffee1.png",
    "Tea": "assets/tea-2.png",
    "Cola": "assets/cola-4.png"
  };
  List<String> items = ["Water", "Coffee", "Tea", "Cola"];

  final List<Widget> _pages = [
    const WaterTab(),
    const CoffeeTab(),
    const TeaTab(),
    const ColaTab()
  ];

  int current = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, -1.05),
              child: Container(
                width: 394,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color(0xFF5AB1EB),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.39, -0.75),
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
              alignment: const AlignmentDirectional(1.58, -1.26),
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
              alignment: AlignmentDirectional(0, 0.85),
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
                      height: 20,
                    ),
                    Container(
                      height: 95,
                      width: size.width,
                      child: Container(
                        height: 95,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              String itemType = items[index];
                              String imageUrl = waterTypes[itemType] ?? "";
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  width: 80,
                                  height: 85,
                                  margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: current == index
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: current == index
                                        ? Border.all(
                                            color: Color(0xFF5AB1EB), width: 2)
                                        : null,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5.0,
                                          offset: Offset(0, 2.5)),
                                    ],
                                  ),
                                  duration: const Duration(microseconds: 300),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 65,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(imageUrl),
                                                fit: BoxFit.cover)),
                                      ),
                                      Center(
                                          child: Text(itemType,
                                              style: GoogleFonts.openSans(
                                                  fontSize: 11,
                                                  color: Color(0xFF594949),
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: double.infinity,
                      child: Column(
                        children: [_pages[current]],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.75, -0.70),
                    child: Text(
                      'Choose water',
                      style: GoogleFonts.openSans(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
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
