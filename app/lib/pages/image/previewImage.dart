import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/pages/image/predict.dart';
import 'package:app/pages/image/testImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class PreviewImagePage extends StatelessWidget {
  final File imagePath;

  const PreviewImagePage({required this.imagePath});

  Future<Map<String, dynamic>> uploadImage(String imagePath) async {
    // API endpoint URL
    var url = Uri.parse(
        'https://food-calories-model-production.up.railway.app/api/predict');

    try {
      // Load image from file
      File imageFile = File(imagePath);
      if (!imageFile.existsSync()) {
        throw Exception("Image file not found");
      }
      List<int> bytes = await imageFile.readAsBytes();

      // Create multipart request
      var request = http.MultipartRequest('POST', url);

      // Add file to request
      var multipartFile = http.MultipartFile.fromBytes('image', bytes,
          filename: imagePath.split('/').last);
      request.files.add(multipartFile);

      // Send request
      var streamedResponse = await request.send();

      // Get response
      var response = await http.Response.fromStream(streamedResponse);

      // Handle response
      if (response.statusCode == 200) {
        // Successful upload
        var jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        // Failed to upload
        print('Failed to upload image. Status code: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      print('Error uploading image: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Image'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Image.file(imagePath),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> response = await uploadImage(imagePath.path); // Pass imagePath.path
                print(imagePath);
                print(response);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PredictionResultsPage(
                          response: response, image: imagePath, /*imagePath*/ )),
                );
              },
              child: Text('Upload'),
            )
          ],
        ),
      ),
    );
  }
}
