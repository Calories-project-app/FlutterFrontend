import 'package:app/pages/home/home.dart';
import 'package:app/pages/login/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('https://foodcal-app.up.railway.app/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': _email.text,
        'password': _password.text,
      }),
    );

    if (!mounted) return;

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);
      final String userInfo = json.encode(data['user']);
      await prefs.setString('userInfo', userInfo);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    } else {
      // If the login failed, display an alert dialog or a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('เข้าสู่ระบบไม่สำเร็จ กรุณาลองใหม่อีกครั้ง.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
                child: Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/tomyumkung.jpg"),
                      fit: BoxFit.cover)),
            )),
            Positioned(
                top: 280,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Log in ',
                            style: GoogleFonts.openSans(
                                fontSize: 36,
                                color: Color(0xFF594949),
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text('Password ',
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Color(0xFF594949),
                                fontWeight: FontWeight.w500)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 80),
                        child: TextField(
                          controller: _password,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 258,
                          height: 57,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFF39200),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: _login,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          child: Text('Forget password?',
                              style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: Color(0xFF594949),
                                  fontWeight: FontWeight.w500)),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ForgetPassword()));
                          },
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
