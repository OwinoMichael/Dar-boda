import 'package:flutter/material.dart';
import 'package:radagast/constants/colors.dart';
import 'package:radagast/routes/route.dart' as route;
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsHome extends StatefulWidget {
  const SettingsHome({Key? key}) : super(key: key);

  @override
  _SettingsHomeState createState() => _SettingsHomeState();
}

class _SettingsHomeState extends State<SettingsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 4,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: FadeInLeft( from: 40,
            child: ListView(
              children: [
                Text(
                  "User Profile",
                  style: GoogleFonts.muli(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: kSecondaryColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.shutterstock.com/image-photo/close-portrait-smiling-young-black-600w-608381294.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Column(
                    children: [
                      Text("Suleyamn Shah", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        indent: 70,
                        endIndent: 70,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("sulyeman@gmail.com",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        indent: 70,
                        endIndent: 70,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("0725472642",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        indent: 70,
                        endIndent: 70,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () => Navigator.pushNamed(context, route.editScreen),
                      child: Text(
                        "EDIT",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2.2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: kPrimaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "SIGN OUT",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}