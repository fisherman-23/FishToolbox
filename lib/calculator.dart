import 'package:flutter/material.dart';
import 'package:prototype_1/appInfoDialog.dart';
import 'package:prototype_1/customWidget.dart';
import 'package:prototype_1/modules/isThisNumber.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
class CalcPage extends StatelessWidget {
  var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
  var colorCard = Color.fromARGB(255, 23, 23, 23);
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent ,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Calculator",style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold',color: Colors.white),),
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
        childAspectRatio: 3, //ratio of height to width or something
        children: [
          InkWell(
            onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>IsThisNumber()),);},child: CustomCard(inputText: "Is this number...", inputText2: "Calculates if a certain number is of a characteristic, eg: prime number", color1: colorCard, color2: colorCard,)),

          CustomCard(inputText: "Qudratic Equation", inputText2: "Calculates the solutions and number of solutions for a certain quadratic equation", color1: colorCard, color2: colorCard,),
          CustomCard(inputText: "Molecular Mass", inputText2: "Calculates the mass of a chemical substance", color1: colorCard, color2: colorCard,),
          CustomCard(inputText: "Balancing Equation", inputText2: "Takes a given Chemical Equation and balance it ", color1: colorCard, color2: colorCard,),
          CustomCard(inputText: "Shoelace Formula", inputText2: "Calculates the area of a simple polygon", color1: colorCard, color2: colorCard,),
          CustomCard(inputText: "Interest Calculator", inputText2: "Calculates simple interst or compound interest", color1: colorCard, color2: colorCard,),
        ],
        )
      
    );
  }
}