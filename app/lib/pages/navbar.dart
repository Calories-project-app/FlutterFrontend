import 'dart:io';

import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/image/previewImage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app/utils/statics.dart';
import 'package:app/pages/home/home.dart';
import 'package:app/pages/image/image_picker.dart';
import 'package:app/pages/image/image_screen.dart';
import 'package:app/pages/leaderboard.dart';
import 'package:app/pages/profile.dart';
import 'package:app/pages/statistics.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  final List<Widget> _pages = [
    const Home(),
    const Statistics(),
    const Leaderboard(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print("No Image Selected");
    }

    return image;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              color: _currentIndex == 0 ?  Colors.black:Colors.white ,
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.leaderboard),
              color: _currentIndex == 1 ?  Colors.black:  Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            const SizedBox(), // Empty space for the centered FAB
            IconButton(
              icon: const Icon(Icons.group),
              color: _currentIndex == 2 ?  Colors.black : Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              color: _currentIndex == 3 ?  Colors.black :Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !showFab,
        child: FloatingActionButton(
          onPressed: () async {
            final selectedImage = await getImage();
            if (selectedImage != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PreviewImagePage(
                          imagePath: selectedImage,
                        )),
              );
            }
          },
          backgroundColor: primaryColor,
          child: const Icon(Icons.camera_alt, color: Colors.white,),
          shape: CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  const PageWidget({Key? key, required this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
