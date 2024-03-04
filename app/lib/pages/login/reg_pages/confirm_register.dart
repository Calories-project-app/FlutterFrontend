import 'package:app/%E0%B8%B5utils/api/post_register.dart';
import 'package:flutter/material.dart';


class ConfirmRegister extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String birthDate;
  final String gender;
  final String height;
  final String weight;
  final String weightGoal;
  final String activityLevel;
  
  const ConfirmRegister({
    Key? key,
    required this.email,
    required this.password,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.height,
    required this.weight,
    required this.weightGoal,
    required this.activityLevel,
  }) : super(key: key);

  @override
  State<ConfirmRegister> createState() => _ConfirmRegisterState();
}

class _ConfirmRegisterState extends State<ConfirmRegister> {
  Future<void> _confirmRegister() async {
    try {
      await APIService.registerUser(
        email: widget.email,
        password: widget.password,
        birthDate: widget.birthDate,
        name: widget.name,
        gender: widget.gender,
        height: widget.height,
        weight: widget.weight,
        weightGoal: widget.weightGoal,
        activityLevel: widget.activityLevel,
      );
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _confirmRegister,
          child: Text('Confirm'),
        ),
      ),
    );
  }
}
