import 'package:app/%E0%B8%B5utils/api/get_top_friend_calories.dart';
import 'package:app/%E0%B8%B5utils/model/GetTopCalorie.dart';
import 'package:app/%E0%B8%B5utils/sharedPerference.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCal extends StatefulWidget {
  const TopCal({Key? key}) : super(key: key);

  @override
  State<TopCal> createState() => _TopCalState();
}

class _TopCalState extends State<TopCal> {
  Future<List<FoodStreak>>? _foodStreakFriendsFuture; // Declare as nullable

  late String _userId; // Declare user ID variable

  @override
  void initState() {
    super.initState();
    String? id;
    Shared.getUserId().then((value) {
      print('dsa');
      print(value);
      setState(() {
        id = value;
        print('id from set');
        print(id);
      });
    });
    print('from top cal init');
    print(id);
    // Fetch user ID and then fetch food streak friends
    Shared.getUserId().then((userId) {
      print('from topcal');
      print(userId);

      if (userId != null) {
        setState(() {
          _userId = userId; // Assign user ID
          _foodStreakFriendsFuture =
              FoodStreakAPI.fetchFoodStreakFriends(_userId);
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
      body: FutureBuilder<List<FoodStreak>>(
        future: _foodStreakFriendsFuture,
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
            List<FoodStreak>? foodStreakFriends = snapshot.data;
            return Container(
              child: ListView.builder(
                itemCount: foodStreakFriends!.length,
                itemBuilder: (context, index) {
                  FoodStreak foodStreak = foodStreakFriends[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color set to white
                        borderRadius: BorderRadius.circular(
                            20), // Make the container round
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Drop shadow color
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
                              width: size.width * 0.1,
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
                                    '${foodStreak.name}',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  if (foodStreak.foodStreak == 1 ||
                                      foodStreak.foodStreak == 0)
                                    Text(
                                      '${foodStreak.foodStreak} day food streak',
                                      style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF706C6C),
                                      ),
                                    )
                                  else
                                    Text(
                                      '${foodStreak.foodStreak} days food streak',
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
              ),
            );
          }
        },
      ),
    );
  }
}
