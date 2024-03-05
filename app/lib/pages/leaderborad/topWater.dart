import 'package:app/%E0%B8%B5utils/api/get_top_friend_water.dart';
import 'package:app/%E0%B8%B5utils/model/GetTopWater.dart';
import 'package:app/%E0%B8%B5utils/sharedPerference.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TopWater extends StatefulWidget {
  const TopWater({Key? key}) : super(key: key);

  @override
  State<TopWater> createState() => _TopWaterState();
}

class _TopWaterState extends State<TopWater> {
  Future<List<WaterStreak>>? _waterStreakFriendsFuture; // Declare as nullable

  late String _userId; // Declare user ID variable
  
  @override
  void initState() {
    super.initState();
    // Fetch user ID and then fetch water streak friends
    Shared.getUserId().then((userId) {
      if (userId != null) {
        setState(() {
          _userId = userId; // Assign user ID
          _waterStreakFriendsFuture =
              WaterStreakAPI.fetchWaterStreakFriends(_userId);
        });
      } else {
        print('Null');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<List<WaterStreak>>(
        future: _waterStreakFriendsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<WaterStreak>? waterStreakFriends = snapshot.data;
            return ListView.builder(
              itemCount: waterStreakFriends!.length,
              itemBuilder: (context, index) {
                WaterStreak waterStreak = waterStreakFriends[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color set to white
                      borderRadius:
                          BorderRadius.circular(20), // Make the container round
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.grey.withOpacity(0.5), // Drop shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 5, // Blur radius
                          offset: Offset(0, 3), // Offset from the container
                        ),
                      ],
                    ),
                    child: Container(
                      width: size.width * 0.8,
                      height: size.height * 0.1,
                      child: Row(
                        children: [
                          Container(
                            width: size.width *0.1,
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${waterStreak.name}',
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                if (waterStreak.waterStreak == 1 ||
                                    waterStreak.waterStreak == 0)
                                  Text(
                                    '${waterStreak.waterStreak} day water streak',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF706C6C),
                                    ),
                                  )
                                else
                                  Text(
                                    '${waterStreak.waterStreak} days water streak',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF706C6C),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
