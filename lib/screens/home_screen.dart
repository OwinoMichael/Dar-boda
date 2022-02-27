import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:radagast/constants/colors.dart';
import 'package:radagast/routes/route.dart' as route;
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 4,
        leading: FadeInDown(from:30, child: Icon(Icons.home, color: Colors.white, size: 33,)),
        title: FadeInDown(from: 30, child: Text("Home", style: GoogleFonts.lato(color: Colors.white, fontSize: 27,fontWeight:FontWeight.bold   ),)),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              FadeInDown(
                from: 50,
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/home.jpg',),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient:
                            LinearGradient(begin: Alignment.bottomRight, colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.2),
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Dar Boda",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Center(
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Horizon',
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  RotateAnimatedText('Welcome #name'),
                                  RotateAnimatedText('Fast affordable rides'),
                                  RotateAnimatedText('Safe parcel delivery'),
                                  RotateAnimatedText('Convinient and reliable'),
                                  
                                ],
                                totalRepeatCount: 2000,
                                pause: const Duration(milliseconds: 500),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                              ),
                            ),
                          
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: FadeInUp(from: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(
                                    image: AssetImage("assets/images/one.jpg"), fit: BoxFit.cover) 
                          ),
                          child: Transform.translate(
                            offset: Offset(0, 70),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 27, vertical: 76),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Center(child: Text("Book a Ride", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,  ),),),
                              ),
                            ),
                          ),
                      ),
                    ),
                    
                    GestureDetector(
                      onTap: () {},
                      child: FadeInUp(from: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                            image: DecorationImage(
                                    image: AssetImage("assets/images/two.jpg"), fit: BoxFit.cover)
                          ),
                          child: Transform.translate(
                            offset: Offset(0, 70),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 76),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  "Send a Parcel",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, route.settingsScreen),
                      child: FadeInUp(from: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey,
                            image: DecorationImage(
                                  image: AssetImage("assets/images/setting1.png"), fit: BoxFit.cover),
                          ),
                          child: Transform.translate(
                            offset: Offset(0, 70),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 76),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}