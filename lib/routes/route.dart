import 'package:flutter/material.dart';
import 'package:radagast/screens/home_screen.dart';
import 'package:radagast/screens/login_screen.dart';
import 'package:radagast/screens/onboarding_screen.dart';
import 'package:radagast/screens/opt_verification.dart';
import 'package:radagast/screens/settings1.dart';
import 'package:radagast/screens/settings2.dart';
import 'package:radagast/screens/signup_screen.dart';



//Route names
const String onBoardingScreen = 'onboard';
const String loginScreen = 'login';
const String signupScreen = 'signup';
const String homeScreen = 'home';
const String settingsScreen = 'set';
const String editScreen = 'edit';
const String verifyScreen = 'verify';


//controller functions, route flow
Route<dynamic> controller(RouteSettings settings){

  switch(settings.name){
    case onBoardingScreen:
      return MaterialPageRoute(builder: (context) => OnBoarding());
    case loginScreen:
      return MaterialPageRoute(builder: (context) => Login());
    case signupScreen:
      return MaterialPageRoute(builder: (context) => Signup());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomePage());
    case settingsScreen:
      return MaterialPageRoute(builder: (context) => SettingsHome());
    case editScreen:
      return MaterialPageRoute(builder: (context) => Settings());
    case verifyScreen:
      return MaterialPageRoute(builder: (context) => Verification());
    default:
      throw("This route does not exist");
  }
}

