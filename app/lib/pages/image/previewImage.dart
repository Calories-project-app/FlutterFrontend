import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/image/predict.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class PreviewImagePage extends StatelessWidget {
  final File imagePath;

  const PreviewImagePage({required this.imagePath});

  Future<Map<String, dynamic>> uploadImage(String imagePath) async {
    // API endpoint URL
    var url =
        Uri.parse('https://ce66-07.cloud.ce.kmitl.ac.th/flask/api/predict');

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preview Image',
          style: GoogleFonts.openSans(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white),
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.8,
              width: size.width,
              child: Image.file(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: size.height * 0.1,
              width: size.width ,
              color: primaryColor,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(10, 10), // Adjust the size here
                ),
                onPressed: () async {
                  print(imagePath.path);
                  Map<String, dynamic> response = await uploadImage(
                      imagePath.path); // Pass imagePath.path
                  print(imagePath);
                  print(response);
              
                  if (response['calories'] == 0 &&
                      response['carb_sum'] == 0 &&
                      response['fat_sum'] == 0 &&
                      response['protein_sum'] == 0 &&
                      response['results'] != null &&
                      response['results'].isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Can not use this image.'),
                          content:
                              Text('This Image is can not use for predict.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: Text('Okay'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PredictionResultsPage(
                          response: response,
                          image: imagePath,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Upload'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
