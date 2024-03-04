import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  TextEditingController _friendId = new TextEditingController();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    print(errorPropertyTextConfiguration);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
            top: true,
            child: Stack(children: [
              Align(
                alignment: const AlignmentDirectional(0, -1.75),
                child: Container(
                  width: 394,
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF39200),
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
                    color: Color(0xFFFFC875),
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
                    color: Color(0xFFFFC875),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.05),
                child: Container(
                  width: size.width,
                  height: 160,
                  child: Column(
                    children: [
                      Text(
                        'Leaderboard',
                        style: GoogleFonts.openSans(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.05,
                          child: TextField(
                            controller: _friendId,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21)),
                                prefixIcon: Icon(
                                  Icons.people_alt,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                ),
                                hintText: "Add friend"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.012,
                      ),
                      Container(
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color(0xFFE18904),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: TabBar(
                                unselectedLabelColor: Colors.white,
                                labelColor: Colors.white,
                                indicatorColor: Colors.transparent,
                                dividerColor: Colors.transparent,
                                indicator: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                controller: tabController,
                                tabs: [
                                  Tab(
                                    child: Container(
                                      width: double
                                          .infinity, // Set width to cover the entire tab
                                      alignment: Alignment.center,
                                      child: Text('Calories' , style: GoogleFonts.openSans(
                                        fontSize : 20, 
                                        fontWeight : FontWeight.w700
                                      ),),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      width: double
                                          .infinity, // Set width to cover the entire tab
                                      alignment: Alignment.center,
                                      child: Text('Water' , style: GoogleFonts.openSans(
                                        fontSize : 20, 
                                        fontWeight : FontWeight.w700
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 120.85),
                child: Container(
                  width: size.width,
                  height: size.height * 0.8225,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('data')],
                  ),
                ),
              )
            ])));
  }
}
