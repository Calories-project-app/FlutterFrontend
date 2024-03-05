import 'package:app/pages/login/forget_password.dart';
import 'package:app/pages/login/reg_pages/email_valification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _confirmPassword = new TextEditingController();
  var _isObscured;

  @override
  void initState() {
    _isObscured = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
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
                          child: Text('Sign up ',
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
                            decoration: InputDecoration(
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
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: TextField(
                            obscureText: _isObscured,
                            controller: _password,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      print(_isObscured);
                                      setState(() {
                                        _isObscured = !_isObscured;
                                      });
                                    },
                                    icon: _isObscured
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text('Confirm Password ',
                              style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: Color(0xFF594949),
                                  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: TextField(
                            obscureText: _isObscured,
                            controller: _confirmPassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      print(_isObscured);
                                      setState(() {
                                        _isObscured = !_isObscured;
                                      });
                                    },
                                    icon: _isObscured
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off))),
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
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  print('Go to Next');
                                  print(_password);
                                  print(_confirmPassword);
                                  if (_password.text != _confirmPassword.text) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Close')),
                                        ],
                                        title: const Text('Password Not Match'),
                                        contentPadding:
                                            const EdgeInsets.all(20.0),
                                        content: const Text(
                                            'You Password is not match {}'),
                                      ),
                                    );
                                  } else {
                                    MaterialPageRoute materialPageRoute =
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                EmailValification(
                                                  email: _email.text,
                                                  password: _password.text,
                                                ));
                                    Navigator.of(context)
                                        .push(materialPageRoute);
                                  }
                                },
                                child: Text(
                                  'Register',
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
      ),
    );
  }
}
