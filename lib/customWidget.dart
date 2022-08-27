import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';

class CustomCard extends StatelessWidget {
  String inputText = 'a';
  String inputText2 = 'a';
  var color1 = Colors.white;
  var color2 = Colors.white;
  CustomCard({Key? key, required this.inputText, required this.inputText2, required this.color1, required this.color2}) : super(key: key);
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  @override
  Widget build(BuildContext context){

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),
      
    ),
    child: Container(
      decoration: BoxDecoration(
      color: color1
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
        Text(inputText, style: TextStyle(fontSize: 23*fontMultiplier, fontFamily: 'ProductSansBold',color: Colors.white)),
        Text( inputText2, style: TextStyle(fontSize: 19*fontMultiplier, fontFamily: 'ProductSansRegular',color: Colors.white)),
      ],

      )
    )
    );
  }
}


class CustomCard2 extends StatelessWidget {
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  String inputText = 'a';
  var icon = Icon(Icons.error);
  var color1 = Colors.white;
  var color2 = Colors.white;
  CustomCard2({Key? key, required this.inputText, required this.icon, required this.color1, required this.color2}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),
      
    ),
    child: Container(
      decoration: BoxDecoration(
        color: color1
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
        SizedBox(height: 20),
        icon, 
        SizedBox(height: 30),
        Text(inputText, style: TextStyle(fontSize: 24*fontMultiplier, fontFamily: 'ProductSansBold',color: Colors.white)),

      ],

      )
    )
    );
  }
}
class CustomCard3 extends StatelessWidget { // for steam builder or future builder cards
  String inputText = 'a';
  Text inputText2 = Text('a');
  var color1 = Colors.white;
  var color2 = Colors.white;
  CustomCard3({Key? key, required this.inputText, required this.inputText2, required this.color1, required this.color2}) : super(key: key);
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  @override
  Widget build(BuildContext context){

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),
      
    ),
    child: Container(
      decoration: BoxDecoration(
      color: color1
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
        Text(inputText, style: TextStyle(fontSize: 23*fontMultiplier, fontFamily: 'ProductSansBold',color: Colors.white)),
        inputText2
      ],

      )
    )
    );
  }
}