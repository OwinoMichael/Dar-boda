import 'package:flutter/material.dart';
import 'package:radagast/constants/colors.dart';
import 'package:radagast/screens/login_screen.dart';
import 'package:radagast/screens/onboarding_screen.dart';
import 'package:radagast/screens/settings1.dart';
import 'package:radagast/screens/settings2.dart';
import 'package:radagast/screens/signup_screen.dart';
import 'package:radagast/routes/route.dart' as route;
import 'package:google_fonts/google_fonts.dart';
import 'package:radagast/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        
      ),
      //home: SettingsHome(),
      onGenerateRoute: route.controller,
      initialRoute: route.onBoardingScreen,
    );
  }
}

