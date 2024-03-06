import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:app/%E0%B8%B5utils/sharedPerference.dart';
import 'package:dio/dio.dart';
import 'package:app/%E0%B8%B5utils/api/post_confirmAddFood.dart';
import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:google_fonts/google_fonts.dart';

class PredictionResultsPage extends StatefulWidget {
  final Map<String, dynamic>? response;
  File? image;

  PredictionResultsPage({required this.response, required this.image});

  @override
  State<PredictionResultsPage> createState() => _PredictionResultsPageState();
}

class _PredictionResultsPageState extends State<PredictionResultsPage> {
  bool showSpinner = false;

  Future<void> upload(
    String foodName,
    String calories,
    String fat,
    String carbohydate,
    String protein,
  ) async {
    Dio dio = Dio();

    setState(() {
      showSpinner = true;
    });

    FormData formData = FormData.fromMap({
      'userId': "651c0e7bdc2e3d9c0ff7b6e0",
      "foodName": foodName,
      "calories": calories,
      "fat": fat,
      "carbohydate": carbohydate,
      "protein": protein,
      "time": DateTime.now().toString(),
      "imgPath": await MultipartFile.fromFile(widget.image!.path),
    });

    try {
      Response response;
      var token = Shared.getToken();

      response = await dio.post(
        'https://foodcal-app.up.railway.app/food-history/saveFood',
        options: Options(headers: {
          "Accept": "application/json",
          "content-type": "multipart/form-data",
          "Authorization": token
        }),
        data: formData,
      );

      if (response.statusCode == 200) {
        debugPrint("Upload Succeses");
        EasyLoading.dismiss();
        if (response.data['status'] == true) {
          print(response.data['message']);
        } else {
          print(response.data['message']);
        }
      }
    } on DioError catch (ex) {
      print(ex.response!.data);
      if (ex.response!.data['message'] != '') {
        print("Error Exception :: ${ex.response!.data['message']} ");
      }
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection Timeout Exception");
      }
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    print('text : ${widget.response} ');
    Map<String, dynamic>? responseData = widget.response;
    String foodName = responseData?['results'][0]['name'] ?? '';
    double calories = responseData?['calories']?.toDouble() ?? 0.0;
    double carbSum = responseData?['carb_sum']?.toDouble() ?? 0.0;
    double fatSum = responseData?['fat_sum']?.toDouble() ?? 0.0;
    double proteinSum = responseData?['protein_sum']?.toDouble() ?? 0.0;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                foodName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: CircleAvatar(
                backgroundImage:
                    widget.image != null ? FileImage(widget.image!) : null,
                radius: 120,
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                  text: '  $calories',
                  style: GoogleFonts.openSans(
                      fontSize: 26,
                      color: tertiaryColor,
                      fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Kilocalories',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
            ),
            SizedBox(height: 10),
            LinearPercentIndicator(
                lineHeight: 12.0,
                width: 330,
                percent: 0.8,
                barRadius: const Radius.circular(20),
                progressColor: primaryColor),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  text: '  $proteinSum',
                  style: GoogleFonts.openSans(
                      fontSize: 26,
                      color: tertiaryColor,
                      fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Protein Grams',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
            ),
            SizedBox(height: 10),
            LinearPercentIndicator(
                lineHeight: 12.0,
                width: 330,
                percent: 0.8,
                barRadius: const Radius.circular(20),
                progressColor: Colors.purple),
                SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  text: '  $carbSum',
                  style: GoogleFonts.openSans(
                      fontSize: 26,
                      color: tertiaryColor,
                      fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Carbs Grams',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
            ),
            SizedBox(height: 10),
            LinearPercentIndicator(
                lineHeight: 12.0,
                width: 330,
                percent: 0.8,
                barRadius: const Radius.circular(20),
                progressColor: Colors.blue),
              SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  text: '  $fatSum',
                  style: GoogleFonts.openSans(
                      fontSize: 26,
                      color: tertiaryColor,
                      fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Fat Grams',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
            ),
            SizedBox(height: 10),
            LinearPercentIndicator(
                lineHeight: 12.0,
                width: 330,
                percent: 0.8,
                barRadius: const Radius.circular(20),
                progressColor: primaryColor),
                
                
            
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                 
                  onPressed: () {
                    // Implement cancel button functionality here
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  child: Text('Cancel' , style: GoogleFonts.openSans(
                    color : Colors.white
                  )),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    upload(foodName, calories.toString(), fatSum.toString(),
                        carbSum.toString(), proteinSum.toString());
                  },
                  child: Text('Confirm', style: GoogleFonts.openSans(
                    color : Colors.white
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
