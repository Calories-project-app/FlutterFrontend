import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
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
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text('Name ',
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Color(0xFF594949),
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                          
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text('Email ',
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Color(0xFF594949),
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextField(
                        controller: _email,
                        decoration: const InputDecoration(
                          
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text('Password ',
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Color(0xFF594949),
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextField(
                        controller: _password,
                        decoration: const InputDecoration(
                          
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text('Confirm Password ',
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Color(0xFF594949),
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextField(
                        controller: _cpassword,
                        decoration: const InputDecoration(
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1.05),
              child: Container(
                width: 160,
                height: 160,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(100),
                        child: Image.asset("assets/tomyumkung.jpg"),
                      ),
                    ),
                  ),
                  radius: 120,
                ),
              ),
            ),
            /*Align(
              child: Stack(
                children: [
                  SizedBox( height: 20,
                  child: Container(
                    color: Colors.amber,
                  ),),
                  Text('dsasda')
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
