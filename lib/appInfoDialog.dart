import 'package:flutter/material.dart';

class AppInfoDialog {
  static var appVer = " V0.1";
  static var about = [Text("Made with love by Jing Shun"), Text("Status: "), InkWell(child: Text('GitHub Page', style: TextStyle(color: Colors.blue),), onTap: () {
    //use launchUrl package to direct user to website
  },)];
}