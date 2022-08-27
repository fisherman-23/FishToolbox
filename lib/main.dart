import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:prototype_1/calculator.dart';
import 'package:prototype_1/converter.dart';
import 'package:prototype_1/fileShare.dart';
import 'package:prototype_1/home.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
  runApp(Phoenix(child:
    MaterialApp(
    title: "Fish's Toolbox",
    home: MyApp(), 
  )));
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
 ));
}

class MyApp extends StatefulWidget {
  @override 
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var currentIndex = 0;
  final screens = [
    HomePage(),
    CalcPage(),
    ConvertPage(),
    FileSharePage(),
  ];
  createAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: EdgeInsets.only(top: 30.0, left: 20.0),
        content: Container(width: 300.0, height: 300.0, child: Text("-"))
        
      );
    });
  }

  
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
      body: Stack(
        children: [HomePageBackground(),screens[currentIndex]],
          
      ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontFamily: 'ProductSansRegular'),
          elevation: 0.0,
          currentIndex: currentIndex, 
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white,),
              label: 'Home',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate, color: Colors.white,),
              label: "Calculate",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horizontal_circle_sharp, color: Colors.white,),
              label: "Convert",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload_rounded, color: Colors.white,),
              label: "File Sharing",
              backgroundColor: Colors.transparent,
            )
          ],
        ),
      )
    );
  }
}