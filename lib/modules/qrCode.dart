import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
class QRCode extends StatefulWidget {
  QRCodeState createState() => QRCodeState();
}
var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
class QRCodeState extends State<QRCode> {
  var snackBar = SnackBar(content: Text('Image Saved'));
  final qrCodeController = TextEditingController(); // qrCodeController is controller for textField
  final screenshotController = ScreenshotController(); 
  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
      .toIso8601String()
      .replaceAll(',', '-')
      .replaceAll(':', '-');
    final name = "qr_code_generated_fish's_toolbox_$time"; // creates time stamp to prevent override
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("QR Code Generator",
         style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white))
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          QrImage(
            data: qrCodeController.text, // qrCodeController.text is the value of textfield 
            size: 200,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: qrCodeController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 252, 156, 48), width: 2.0,)
                ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 252, 156, 48), width: 2.0,)
              ),
              hintText: 'Enter a text or a link',
              hintStyle: TextStyle(color: Colors.white70, fontFamily: 'ProductSansRegular')
                ),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            child: Icon(Icons.download),
            backgroundColor: Colors.black,
            onPressed: () async {
            final image = await screenshotController.captureFromWidget(QrImage(
            data: qrCodeController.text,
            size: 200,
            backgroundColor: Colors.white,
          ));
            if (image == null) {
              snackBar = SnackBar(content: Text('Please enter a text'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            else 
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              saveImage(image);
            
          }
    ) 
        ]
      ),
        
    );
  }
}

