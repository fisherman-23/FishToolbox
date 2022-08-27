import 'package:flutter/material.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
class IsThisNumber extends StatelessWidget {
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Is This Number...",
         style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white))
      ),
      body: Column(
        children: [
          
        ]
        
        ),
    );
  }
}