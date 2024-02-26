import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
            top: true,
            child: Stack(children: [
              Align(
                alignment: const AlignmentDirectional(0, -1.75),
                child: Container(
                  width: 394,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF39200),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.39, -1.05),
                child: Container(
                  width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFC875),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.58, -1.66),
                child: Container(
                  width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFC875),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 50.85),
                child: Container(
                  width: 395,
                  height: 643,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      

                    ],
                  ),
                ),
              )
            ])));
  }
}
