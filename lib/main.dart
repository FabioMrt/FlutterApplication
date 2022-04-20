import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Nav.dart';
import 'package:flutter_application_1/screens/homescreen/vaga_info.dart';
import 'package:flutter_application_1/screens/login/login.dart';
import 'package:flutter_application_1/screens/login/reset_password.dart';
import 'package:flutter_application_1/screens/login/signup.dart';
import 'package:flutter_application_1/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/components/Nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: kPrimaryColor,
      ),
      home: Onboarding(),
    );
  }
}
