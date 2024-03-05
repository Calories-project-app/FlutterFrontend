import 'package:app/%E0%B8%B5utils/api/testWaterApi.dart';
import 'package:app/%E0%B8%B5utils/model/testWater.dart';
import 'package:app/%E0%B8%B5utils/sharedPerference.dart';

import 'package:flutter/material.dart';

class WaterHistoryScreen extends StatelessWidget {
  var userId = Shared.getUserId().toString();
  var date = "2024-03-05";
  var token = Shared.getToken().toString();

   WaterHistoryScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DayStatistics>(
      future: fetchDayStatistics(token as String, userId as String, date as String),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final dayStatistics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(title: Text('Water History')),
            body: ListView.builder(
              itemCount: dayStatistics.waterHistory.length,
              itemBuilder: (context, index) {
                final item = dayStatistics.waterHistory[index];
                return ListTile(
                  title: Text(item.waterName),
                  subtitle: Text('Calories: ${item.calories}'),
                  // Display other properties as needed
                );
              },
            ),
          );
        }
      },
    );
  }
}
