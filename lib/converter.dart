import 'package:flutter/material.dart';
import 'package:prototype_1/appInfoDialog.dart';
import 'package:prototype_1/customWidget.dart';
import 'package:prototype_1/modules/qrCode.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
class ConvertPage extends StatelessWidget {
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  var colorCard = Color.fromARGB(255, 23, 23, 23);
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.transparent,
        title: Text("Converter",style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold',color: Colors.white),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline_rounded),
              color: Colors.white,
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationVersion: AppInfoDialog.appVer,
                  children: AppInfoDialog.about
                );
              },
            ),
          ],
      ),
      body: GridView.count(
        clipBehavior: Clip.antiAlias,
        crossAxisCount: 1,
        childAspectRatio: 3,
        children: [
          CustomCard(inputText: "Text Converter", inputText2: "Converts a text to methods like ASCII and binary, and vice versa", color1: colorCard, color2: colorCard),
          CustomCard(inputText: "File Format", inputText2: "Converts a file format to another, eg: PDF to image, audio formats, zip compression", color1: colorCard, color2: colorCard),
          InkWell(onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>QRCode()),);},child: 
          CustomCard(inputText: "QR Code Generator", inputText2: "Converts a link/text to a QR code", color1: colorCard, color2: colorCard)),
  
          CustomCard(inputText: "Unit Converter", inputText2: "Converts a certain type of unit to another type, eg: Celcius to Kelvin", color1: colorCard, color2: colorCard),
          CustomCard(inputText: "Colour Converter", inputText2: "Converts a between hex values, css, RGB, etc", color1: colorCard, color2: colorCard),
        ],
      )
    );
  }
}