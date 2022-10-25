import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';

class Verification extends StatefulWidget {
  VerificationState createState() => VerificationState();
}
class VerificationState extends State<Verification> {
  var homeCardColor = Color.fromARGB(255, 23, 23, 23);
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  @override 
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Verification Suite",
         style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white))

      ),
      body: Container(padding: EdgeInsets.all(20),
        child: Column(children: [Text("NRIC",
         style: TextStyle(fontSize: 23*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white))]),
      )
      );
  }
}