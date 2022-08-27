import 'package:flutter/material.dart';
import 'package:prototype_1/appInfoDialog.dart';
import 'package:prototype_1/customWidget.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
class FileSharePage extends StatelessWidget {
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  var colorCard = Color.fromARGB(255, 23, 23, 23);
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("File Sharing",style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold',color: Colors.white),),
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
      body: Column(
        children: [
          SizedBox(height: 0),
          GridView.count(
            clipBehavior: Clip.antiAlias,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              CustomCard2(inputText: "Send", icon: Icon(Icons.upload, size: 50, color: Colors.white,), color1: colorCard, color2: colorCard),
              CustomCard2(inputText: "Receive", icon: Icon(Icons.download, size: 50, color: Colors.white,), color1: colorCard, color2: colorCard)
            ],
          )
        ],
      )
    );
  }
}