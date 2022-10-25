
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype_1/appInfoDialog.dart';
import 'package:prototype_1/customWidget.dart';
import 'package:prototype_1/modules/verification.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
import 'package:prototype_1/settings.dart';
import 'package:thermal/thermal.dart';

class HomePage extends StatelessWidget {

  @override 
  var _thermal = Thermal();
  var homeCardColor = Color.fromARGB(255, 23, 23, 23);
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  var a = '-';
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Fish's Toolbox",
         style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white)),
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
                    IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              // navigare to settings page
              
              Navigator.push(context,MaterialPageRoute(builder: (context) =>Settings()),);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("  QuickBits ", style: TextStyle(fontSize: 28*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white, backgroundColor: Colors.black38), textAlign: TextAlign.left,),
          GridView.count(
            clipBehavior: Clip.antiAlias,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 2,
            children:[
              CustomCard(inputText: "Sound", inputText2: "-", color1: homeCardColor, color2: homeCardColor,),
              CustomCard(inputText: "RNG", inputText2: "-", color1: Color.fromARGB(255, 25, 118, 210), color2: homeCardColor),
              CustomCard(inputText: "Light", inputText2: "-", color1: Color.fromARGB(255, 251, 192, 45), color2: homeCardColor,),
                          StreamBuilder<ThermalStatus>(
                stream: Thermal().onThermalStatusChanged,
                builder: (context, snapshot1) {
                  return StreamBuilder<double>(
                    stream: Thermal().onBatteryTemperatureChanged,
                    builder: (context, snapshot2){
                    if (snapshot1.data.toString() == 'ThermalStatus.none'){
                      a = 'None';
                    } else if  (snapshot1.data.toString() == 'ThermalStatus.light'){
                      a = 'Light';
                    } else if (snapshot1.data.toString() == 'ThermalStatus.moderate') {
                      a = 'Moderate';
                    } else if (snapshot1.data.toString() == 'ThermalStatus.severe') {
                      a = 'Severe';
                    } else if (snapshot1.data.toString() == 'ThermalStatus.critical') {
                      a = 'Critical';

                    } else if (snapshot1.data.toString() == 'ThermalStatus.emergency') {
                      a = 'Emergency';
                    }
                      return CustomCard3(inputText: "Thermals", inputText2: Text("${a} (${snapshot2.data}°C)",style: TextStyle(fontSize: 19*fontMultiplier, fontFamily: 'ProductSansRegular',color: Colors.white),), color1: Colors.redAccent, color2: homeCardColor);
                    }
                  );
                  
                }),
            ]
            ,),

          Text("  Miscellaneous ", style: TextStyle(fontSize: 28*fontMultiplier,fontFamily: 'ProductSansRegular',color: Colors.white, backgroundColor: Colors.black38), textAlign: TextAlign.left,),

          Expanded(child:GridView.count(
            clipBehavior: Clip.antiAlias,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 3,
            crossAxisCount: 1,
            children: [
          InkWell(onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>Verification()),);},child: CustomCard(inputText: "Verification Suite", inputText2: "Contains a variety of verification tools for everyday use", color1: homeCardColor, color2: homeCardColor,),),
           CustomCard(inputText: "Compression", inputText2: "Compresses a video file or a image file", color1: homeCardColor, color2: homeCardColor,),
  
           ]))
          
        ]),
    );
  }
}

class HomePageBackground extends StatelessWidget { // contains background for the app
  var backgroundValue = UserSimplePreferences.getBackgroundColor() ?? 'Blue-Purple Gradient';
  var backgroundNum = 0;
  final background = [BgGradient1(),BgColor1()]; //list of the background 
  @override 
  Widget build(BuildContext context) {
      if (backgroundValue == 'Blue-Purple Gradient'){
    backgroundNum = 0;
  } else if (backgroundValue == 'AMOLED Black'){
    backgroundNum =1;
  } else {
    backgroundNum = 0;
  }
    return Scaffold(
      
      body: background[backgroundNum]
    );
  }
}

class BgGradient1 extends StatelessWidget { //option 1 of background gradient (blue purple)
  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromARGB(255, 18, 51, 99),
                Color.fromARGB(255, 44, 93, 157),
                Color.fromARGB(255, 74, 97, 165),
                Color.fromARGB(255, 83, 85, 142),
              ],
            )),
    );
  }
}

class BgColor1 extends StatelessWidget { // option 1 of background color (amoled black)
  @override 
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color: Colors.black
    ));
  }
}