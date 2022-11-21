
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
  var thermalStatus = '-';
  void thermalCustomDialog(BuildContext context, height) => showDialog(
    
    context: context, 
    builder: (BuildContext context) {
      
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.redAccent,
            
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:Column(
        
        mainAxisSize: MainAxisSize.min,
        children: [SizedBox(height: 10,),
        Container(height: height*0.6,
        
        child: Column(
          children: [
            Text("Thermals", style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white),),
            SizedBox(height: 5),
            Text("Value in bracket shows temperature of battery in degree Celcius", style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white),),

            SizedBox(height: 10),
            RichText(text: TextSpan(text: 'None ', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white),
            children: [TextSpan(text: '- The device is operating normally with no throttling', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white))
            ])),
            SizedBox(height: 7),
            
            RichText(text: TextSpan(text: 'Light ', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white),
            children: [TextSpan(text: '- The device is throttling where UX is not impacted', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white))])),            
            SizedBox(height: 7),
            RichText(text: TextSpan(text: 'Moderate ', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white),
            children: [TextSpan(text: '- The device is throttling where UX is not largely impacted. Android only', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white))])),            
            SizedBox(height: 7),
            RichText(text: TextSpan(text: 'Severe ', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white),
            children: [TextSpan(text: '- The device is throttling where UX is impacted', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white))])),            
            SizedBox(height: 7),
            RichText(text: TextSpan(text: 'Critical ', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white),
            children: [TextSpan(text: '- The device is throttling where everything is being done to reduce power.', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white))])),            
            SizedBox(height: 7),
            RichText(text: TextSpan(text: 'Emergency ', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white),
            children: [TextSpan(text: '- Key components in the platform are shutting down. Android only', style: TextStyle(fontSize: 17*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white))])),            
            SizedBox(height: 10),
            Text("https://github.com/muxable/flutter_thermal", style: TextStyle(fontSize: 14*fontMultiplier, fontFamily: 'ProductSansRegular', color: Colors.white),),
        ]),),
        SizedBox(height: 10,)
      ],)));

    },
  );

  Widget build(BuildContext context) {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    final deviceWidth = data.size.width;
    final deviceHeight = data.size.height;
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
                      thermalStatus = 'None';
                    } else if  (snapshot1.data.toString() == 'ThermalStatus.light'){
                      thermalStatus = 'Light';
                    } else if (snapshot1.data.toString() == 'ThermalStatus.moderate') {
                      thermalStatus = 'Moderate';
                    } else if (snapshot1.data.toString() == 'ThermalStatus.severe') {
                      thermalStatus = 'Severe';
                    } else if (snapshot1.data.toString() == 'ThermalStatus.critical') {
                      thermalStatus = 'Critical';

                    } else if (snapshot1.data.toString() == 'ThermalStatus.emergency') {
                      thermalStatus = 'Emergency';
                    }
                      return InkWell(onTap: () => thermalCustomDialog(context, deviceHeight),child: CustomCard3(inputText: "Thermals", inputText2: Text("${thermalStatus} (${snapshot2.data}°C)",style: TextStyle(fontSize: 19*fontMultiplier, fontFamily: 'ProductSansRegular',color: Colors.white),), color1: Colors.redAccent, color2: homeCardColor));
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