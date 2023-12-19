import 'dart:io';

import 'package:app/%E0%B8%B5utils/statics.dart';
import 'package:app/pages/home/home.dart';
import 'package:app/pages/image/image_picker.dart';
import 'package:app/pages/leaderboard.dart';
import 'package:app/pages/profile.dart';
import 'package:app/pages/statistics.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  File? image;

  pickImage(ImageSource source) {
    AppImagePicker(source: source).pick(onPick: (File? image) {
      setState(() {
        this.image = image;
      });
    });
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Statistics(),
    const Leaderboard(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.leaderboard),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            const SizedBox(), // Empty space for the centered FAB
            IconButton(
              icon: const Icon(Icons.group),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          pickImage(ImageSource.camera); 
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  const PageWidget({super.key, required this.color, required this.title});

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
