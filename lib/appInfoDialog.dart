
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class AppInfoDialog {
  static var appVer = " V0.1";
  static var about = [Text("Made with love by Jing Shun"), Text("Status: "), InkWell(child: Text('GitHub Page', style: TextStyle(color: Colors.blue),), onTap: () async {
    //use launchUrl package to direct user to website
    final Uri _url = Uri.parse('https://github.com/fisherman-23/FishToolbox');
                          if (await canLaunch('https://github.com/fisherman-23/FishToolbox')) {
                            await launch('https://github.com/fisherman-23/FishToolbox', forceSafariVC: false);
                          }
                          print('pressed');
  },)];
}