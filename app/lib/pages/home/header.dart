import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: EdgeInsets.all(0), 
            child:Text(
              'Hi!',
              style: TextStyle(
                fontSize: size.width * 0.12,
                color: Colors.black,
                fontFamily: 'Open Sans',
                height: 1,
                fontWeight: FontWeight.w900,
              ),
            ),)
            
             
          ],
        ),
        toolbarHeight: size.height * 0.2,
        actions: const [
          Icon(
              Icons.bar_chart_sharp, 
              color: Colors.black,
              size: 50,
            ) 
        ],
        );
  }
}
