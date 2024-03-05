import 'dart:convert';

import 'package:app/%E0%B8%B5utils/sharedPerference.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/home/header.dart';
import 'package:app/pages/home/sumary_water.dart';
import 'package:app/pages/home/summary_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  
  Future<Map<String, dynamic>?> loadUserInfoAndStatistics() async {
    final userInfo = await Shared.getUserInfo();
    final token = await Shared.getToken();
    if (userInfo != null && token != null) {
      final responseData = await getStatistics(token, userInfo);
      return {
        'userInfo': userInfo,
        'statistics': responseData,
      };
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>?> getStatistics( String token, Map<String, dynamic> userInfo) async {
    String userId = userInfo['_id'];
    DateTime now = DateTime.now();
    try {
      final response = await http.post(
        Uri.parse(
            'https://foodcal-app.up.railway.app/food-history/foodHistory/oneDayStatistics'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'date': now.toIso8601String(),
        }),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData;
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        /*actions: <Widget>[
          Icon(
            Icons.bar_chart_outlined,
            size: 38,
            color: Colors.black,
          )
        ],*/
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<Map<String, dynamic>?>(
                  future: loadUserInfoAndStatistics(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      final userInfo = snapshot.data?['userInfo'];
                      final statistics =
                          snapshot.data?['statistics']; // Now locally available
                      String userName = userInfo?["email"] ?? "User";
                      return Column(
                        children: [
                          Text(
                            'Hi $userName',
                            style: GoogleFonts.openSans(
                                fontSize: 28,
                                color: primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Summary_Nutrition(
                              userInfo: userInfo,
                              statistics: statistics), // Pass statistics here
                          SummaryWater(),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Text(
                            'Hi User',
                            style: GoogleFonts.openSans(
                                fontSize: 28,
                                color: primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          // Consider what you want to do if no user info or statistics are available
                          Text('Unable to load data'),
                        ],
                      );
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
