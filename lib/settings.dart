import 'package:flutter/material.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
class Settings extends StatefulWidget {
  SettingsState createState() => SettingsState();
}
class SettingsState extends State<Settings> {
  String? backgroundValue; //value of background color dropdownlist
  final backgroundOptions = ['AMOLED Black','Blue-Purple Gradient'];
  num fontMultiplier =1;
  var snackBar = SnackBar(content: Text('Saved! Restart application for changes to take effect.'));
  void initState() {
    super.initState();
    fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
    backgroundValue = UserSimplePreferences.getBackgroundColor() ?? 'Blue-Purple Gradient';
  }
  @override
  Widget build(BuildContext context) {
    var fontMultiplierCopy = UserSimplePreferences.getFontMultiplier() ?? 1.0;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Settings",
         style: TextStyle(fontSize: 30*fontMultiplierCopy, fontFamily: 'ProductSansBold', color: Colors.white))
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
        children: [
          Row(
            children: [
              Text("Font Multiplier", style: TextStyle(fontSize: 23*fontMultiplierCopy, fontFamily: "ProductSansRegular", color: Colors.white),),
              SizedBox(width: 50,),
              Flexible(child:TextFormField(
                initialValue: fontMultiplier.toString(),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.deepPurpleAccent,width: 1.5),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1.5),
                   ),  ),
                keyboardType: TextInputType.number,
                onChanged: (fontMultiplier) => setState(() => this.fontMultiplier = double.parse(fontMultiplier)),
              ))
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Text("Background Color", style: TextStyle(fontSize: 23*fontMultiplierCopy, fontFamily: "ProductSansRegular", color: Colors.white),),
              SizedBox(width: 50,),
              Flexible(
                
                child: DropdownButton<String>(
                  dropdownColor: Colors.black87,
                  isExpanded: true,
                  value: backgroundValue,
                  underline: Container( height: 1.5, color: Colors.deepPurpleAccent,),
                items: backgroundOptions.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() => this.backgroundValue = value), //update the ui 
                ))
            ],
          ),
          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: deviceWidth*0.4,
                child:Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.all(
                  Radius.circular(45.0),
                      ),
                    ),
                child:
              TextButton(
                
                onPressed: () async {
            if (fontMultiplier > 2) {
              fontMultiplier = 2;
            }
            await UserSimplePreferences.setBackgroundColor(backgroundValue.toString());
            await UserSimplePreferences.setFontMultiplier(double.parse(fontMultiplier.toString()));
            //print(UserSimplePreferences.getBackgroundColor() ?? 1.0);
            //saves pref
            ScaffoldMessenger.of(context).showSnackBar(snackBar); 
            Phoenix.rebirth(context); //restarts app for changes to take effect
          }, child: Text('Save')))),

          SizedBox(
            width: deviceWidth*0.4,
            child:Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.all(
                  Radius.circular(45.0),
                      ),
                    ),
            child:TextButton(
              onPressed: () async {
            //resets app to default
            await UserSimplePreferences.setFontMultiplier(1.0);
            await UserSimplePreferences.setBackgroundColor('Blue-Purple Gradient');
            Phoenix.rebirth(context); // restarts whole app
          }, child: Text('Reset', style: TextStyle(color: Colors.red),))))])
        ]
        
        )),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String backgroundOptions) => 
    DropdownMenuItem(value: backgroundOptions,
    child: Text(
      backgroundOptions,
      style: TextStyle(fontFamily: 'ProductSansRegular', color: Colors.white)),
    );
}