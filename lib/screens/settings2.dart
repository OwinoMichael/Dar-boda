import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radagast/constants/colors.dart';
import 'package:radagast/routes/route.dart' as route;
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 4,
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: Icon(
            Icons.arrow_back,
            color: kBackgroundColor,
          )
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: FadeInLeft(from: 30,
            child: ListView(
              children: [
                Text(
                  "Edit Profile", style: GoogleFonts.muli(
                    fontSize: 25, fontWeight: FontWeight.bold,
                  ), 
                ),
                SizedBox(height: 15,),
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
                                spreadRadius: 2, blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0,10),
                              )
                            ],
                         
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage("https://image.shutterstock.com/image-photo/close-portrait-smiling-young-black-600w-608381294.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0, 
                        child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: kBackgroundColor,
                          ),
                          color: kPrimaryColor,
                        ),
                        child: Icon(Icons.edit, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35,),
                buildTextField("Name", "Suleyman Shah", false),
                buildTextField("Phone", "0726435793", true),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () =>
                          Navigator.pop(context),
                      child: Text("CANCEL",
                      style: TextStyle(
                        fontSize: 18, letterSpacing: 2.2,
                        color: Colors.black,
                      ),),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: kPrimaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("SAVE", style: TextStyle(
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

  Widget buildTextField(String labelText, String placeholder, bool isPhoneTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500
                  ),
                  keyboardType: isPhoneTextField ? TextInputType.phone : TextInputType.name,
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.only( bottom: 3),
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: TextStyle(
                    fontSize: 19, fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
    );
  }
}