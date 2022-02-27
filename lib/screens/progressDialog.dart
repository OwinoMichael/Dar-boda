import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radagast/constants/colors.dart';

class ProgressDialog extends StatelessWidget {
  String message;
  ProgressDialog({ required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kPrimaryColor,
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
             SizedBox(width: 6.0,),
             CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),),
             SizedBox(width: 26.0,),
             Text(
               message,
               style: TextStyle(color: Colors.black, fontSize: 13.0),
               ),
            ],
            ),
        ),
      ),
    );
  }
}