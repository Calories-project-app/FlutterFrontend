import 'package:app/%E0%B8%B5utils/api/get_food_by_id_and_date.dart';
import 'package:app/%E0%B8%B5utils/model/GetFoodOneDayByIdAndDate.dart';
import 'package:flutter/material.dart';

class WaterStatisticTab extends StatefulWidget {
  const WaterStatisticTab({Key? key}) : super(key: key);

  @override
  State<WaterStatisticTab> createState() => _WaterStatisticTabState();
}

class _WaterStatisticTabState extends State<WaterStatisticTab> {
  late Future<GetFoodOneDayByIdAndDate> _foodByIdFuture;

  @override
  void initState() {
    super.initState();
    _foodByIdFuture = getFoodByIdDate("651c0e7bdc2e3d9c0ff7b6e0", "2024-02-22" , "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NTZmMzFkOTA1MDVlMjY3ZWJmNWVhNTciLCJpYXQiOjE3MDg0ODc3OTEsImV4cCI6MTcwOTA5MjU5MX0.RkjXI3JPRWY_0vx9x9uLrhk6hwifuilKv4kJ8dpyKuc" );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetFoodOneDayByIdAndDate>(
      future: _foodByIdFuture,
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
          // Data fetched successfully, display it
          final data = snapshot.data!;
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Calories: ${data.totalCalories}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Total Fat: ${data.totalFat}',
                  style: TextStyle(fontSize: 18),
                ),
                // Add more Text widgets to display other data fields as needed
              ],
            ),
          );
        }
      },
    );
  }
}
