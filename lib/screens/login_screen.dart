import 'package:flutter/material.dart';
import 'package:radagast/animation/FadeAnimation.dart';
import 'package:radagast/constants/colors.dart';
import 'package:radagast/routes/route.dart' as route;
import 'package:radagast/screens/progressDialog.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showEye = false;

  bool _passwordIsEncrypted = true;

  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              FadeAnimation(1, 
              Image.asset('assets/images/logo.jpg', width: 250, height: 250,)
              ),
              SizedBox(height: 5),
              FadeAnimation(1,         //F1
              Text(
                "Welcome Back",
                style: GoogleFonts.muli(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kSecondaryColor,
                ),
              ),
              ),
              FadeAnimation(1.2,  //F2
              Text(
                "Sign in to continue",
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
              ),

              SizedBox(
                height: 20,
              ),
              FadeAnimation(1.3,    //F3
                 Container(
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
              FadeAnimation(1.3,
               Container(
                  child: TextFormField(
                    style: GoogleFonts.publicSans(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    obscureText: _showEye ? _passwordIsEncrypted : true,
                    onChanged: (enteredPassword) {
                      _password = enteredPassword;
                      if (enteredPassword.isEmpty) {
                        setState(() {
                          _showEye = false;
                        });
                      } else {
                        if (!_showEye) {
                          setState(() {
                            _showEye = !_showEye;
                          });
                        }
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock, size: 30),
                      suffixIcon: _showEye
                          ? GestureDetector(
                              child: _passwordIsEncrypted
                                  ? Container(
                                      child: Icon(
                                        Icons.visibility,
                                        color: Colors.blueGrey,
                                      ),
                                    )
                                  : Container(
                                      child: Icon(
                                        Icons.visibility_off,
                                        color:kPrimaryColor,
                                      ),
                                    ),
                              onTap: () {
                                setState(() {
                                  _passwordIsEncrypted = !_passwordIsEncrypted;
                                });
                              },
                            )
                          : null,
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              FadeAnimation(1.3,
                 Row(   //F4
                   mainAxisAlignment: MainAxisAlignment.end,       
                  children: [
                    
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context, 
                          barrierDismissible: false,
                          builder: (BuildContext context){
                            return ProgressDialog(message: "Authenticating, Please wait",);
                          }
                        );
                      },
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: FadeAnimation(1.4,  //F5
                   FlatButton(
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    onPressed: () =>
                        Navigator.pushNamed(context, route.homeScreen),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("LOGIN", style: GoogleFonts.publicSans(
                      fontSize: 20,
                      letterSpacing: 2.2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(1.5,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 19,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, route.signupScreen),
                    child: Text(
                      "Register",
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
    );
  }
}
