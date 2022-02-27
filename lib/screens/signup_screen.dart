import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:radagast/constants/colors.dart';
import 'package:radagast/routes/route.dart' as route;
import 'package:radagast/animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin{

  // bool _showEye = false;

  // bool _passwordIsEncrypted = true;

  // String _password = '';

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  late AnimationController loadingController;

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    
    loadingController.forward();

    super.initState();
  }

  @override
  void dispose() {
    loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                FadeInDown( duration: Duration(milliseconds: 600 ),
                  child: Image.asset('assets/images/logo.jpg', width: 170, height: 150,)
                ),
                
                FadeInDown(
                  duration: Duration(milliseconds: 700),
                   child: Text(
                    "SIGN UP",
                    style: GoogleFonts.muli(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 500),
                  duration: Duration(milliseconds: 700),
                child: Text(
                    "Create a new account",
                    style: GoogleFonts.ubuntu(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 600),
                  duration: Duration(milliseconds: 700),
                  child: Container(
                    child: TextFormField(
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person_outlined, size: 30),
                        labelText: "NAME",
                        labelStyle: GoogleFonts.publicSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 700),
                  duration: Duration(milliseconds: 700),
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: GoogleFonts.publicSans(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone, size: 30),
                        labelText: "PHONE NUMBER",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  duration: Duration(milliseconds: 700),
                  child: TextFormField(
                    style: GoogleFonts.publicSans(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    onChanged: (password) => onPasswordChanged(password),
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = _isVisible;
                          });
                        },
                        icon: _isVisible
                            ? Icon(
                                Icons.lock,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                      ),
                      border: InputBorder.none,
                      labelText: "PASSWORD", 
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                 FadeInDown(
                  delay: Duration(milliseconds: 900),
                  duration: Duration(milliseconds: 700),
                   child: Row(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _isPasswordEightCharacters
                                ? Colors.green
                                : Colors.transparent,
                            border: _isPasswordEightCharacters
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Contains at least 8 characters", style: GoogleFonts.sourceSansPro(
                        color: Colors.black,
                        fontSize: 18,
                      ),)
                    ],
                                 ),
                 ),
                SizedBox(
                  height: 10,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 1000),
                  duration: Duration(milliseconds: 700),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _hasPasswordOneNumber
                                ? Colors.green
                                : Colors.transparent,
                            border: _hasPasswordOneNumber
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Contains at least 1 number", style: GoogleFonts.sourceSansPro(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 1100),
                  duration: Duration(milliseconds: 700),
                   child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: FlatButton(
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      onPressed: () =>
                          Navigator.pushNamed(context, route.verifyScreen),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("REQUEST OTP", 
                         style: GoogleFonts.publicSans(fontSize: 20, letterSpacing: 2.2, fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 1300),
                  duration: Duration(milliseconds: 700),
                   child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 19,
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, route.loginScreen),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ]),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
