import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:radagast/constants/colors.dart';
import 'package:radagast/routes/route.dart' as route;
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  List<dynamic> _onBoard = [
    {
      'title': 'Welcome \nTo 1Boda',
      'sub_title': 'The Number 1 Taxi Hailing Rider Application.',
      'image': "assets/images/slider1.jpg",
    },
    {
      'title': 'Request \nRides',
      'sub_title': 'We Have a Team of Qualified Riders Ready to Pick You Up.',
      'image': 'assets/images/slider2.jpg'
    },
    {
      'title': 'We do \nParcel Delivery',
      'sub_title': 'Need to Send a Parcel? We\'ve Got You Covered.',
      'image': 'assets/images/slider3.jpg'
    },
    {
      'title': 'Fast And\nAffordable',
      'sub_title':
          'Our Services Are Efficient And Our Rates Are Within Your Reach.',
      'image': 'assets/images/slider4.jpg'
    },
  ];

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 20),
  )..repeat(reverse: true);

  late final Animation<double> _animation = Tween<double>(begin: 1.0, end: 1.5)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (int index) {
          _controller.value = 0.0;
          _controller.forward();
        },
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      _onBoard[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.1)
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDown(
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            _onBoard[index]['title'],
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeInDown(
                            delay: Duration(milliseconds: 100),
                            duration: Duration(milliseconds: 800),
                            child: Text(
                              _onBoard[index]['sub_title'],
                              style: GoogleFonts.ubuntu(
                                color: Colors.grey.shade400,
                                fontSize: 18,
                              ),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        FadeInLeft(
                          delay: Duration(milliseconds: 100),
                          duration: Duration(milliseconds: 1000),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                onPressed: () => Navigator.pushNamed(
                                    context, route.signupScreen),
                                color: Colors.indigo[300],
                                padding: EdgeInsets.only(
                                    right: 5, left: 30, top: 5, bottom: 5),
                                child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Get Started',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Colors.indigo[900],
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: _onBoard.length,
        controller: PageController(viewportFraction: 1.0),
      ),
    );
  }
}
