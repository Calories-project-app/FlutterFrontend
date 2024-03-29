import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class TestImage extends StatefulWidget {
  final Map<String, dynamic> response;
  final String imagePath;

  TestImage({
    Key? key,
    required this.response,
    required this.imagePath,
  }) : super(key: key);

  @override
  _TestImageState createState() => _TestImageState();
}

class _TestImageState extends State<TestImage> {
  Future<void> uploadFoodData() async {
    try {
      // Temporary values for testing
      String foodName = 'Test Food';
      String time = DateTime.now().toString();
      String userId = '651c0e7bdc2e3d9c0ff7b6e0';

      // Save the file to the assets directory
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = tempDir.path;
      File imageFile = File('$tempPath/${widget.imagePath.split('/').last}');
      ByteData data = await rootBundle.load(widget.imagePath);
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await imageFile.writeAsBytes(bytes);

      // Prepare the data
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://foodcal-api-latest.onrender.com/food-history/saveFood'),
      );
      request.fields['userId'] = userId;
      request.fields['calories'] = widget.response['calories'].toString();
      request.fields['fat'] = widget.response['fat_sum'].toString();
      request.fields['carbohydrate'] = widget.response['carb_sum'].toString();
      request.fields['protein'] = widget.response['protein_sum'].toString();
      request.fields['foodName'] = foodName;
      request.fields['time'] = time;
      request.files.add(
        await http.MultipartFile.fromPath('imagePath', imageFile.path),
      );

      // Add Authorization header
      request.headers['Authorization'] =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NTZmMzFkOTA1MDVlMjY3ZWJmNWVhNTciLCJpYXQiOjE3MDg0ODc3OTEsImV4cCI6MTcwOTA5MjU5MX0.RkjXI3JPRWY_0vx9x9uLrhk6hwifuilKv4kJ8dpyKuc';

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // Check the response
      if (response.statusCode == 200) {
        // Success
        print('Food data uploaded successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Food data uploaded successfully')),
        );
      } else {
        // Failure
        print(
            'Failed to upload food data. Status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload food data')),
        );
      }
    } catch (e) {
      // Exception occurred
      print('Error uploading food data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading food data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Test Results'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display image and results as before...
            Text(
              'Image Path: ${widget.imagePath}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              widget.imagePath,
              height: 200,
            ),
            // Add a button to upload data
            ElevatedButton(
              onPressed: uploadFoodData,
              child: Text('Upload Food Data'),
            ),
          ],
        ),
      ),
    );
  }
}
