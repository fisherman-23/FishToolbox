import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype_1/services/userSimplePreferences.dart';
import 'package:speed_test_dart/classes/classes.dart';
import 'package:speed_test_dart/speed_test_dart.dart';


class InternetSpeed extends StatefulWidget {
  const InternetSpeed({super.key});

  @override
  State<InternetSpeed> createState() => _InternetSpeedState();
}
var fontMultiplier = UserSimplePreferences.getFontMultiplier() ?? 1.0;
class _InternetSpeedState extends State<InternetSpeed> {
  SpeedTestDart tester = SpeedTestDart();
  List<Server> bestServersList = [];

  double downloadRate = 0;
  double uploadRate = 0;

  bool readyToTest = false;
  bool loadingDownload = false;
  bool loadingUpload = false;

  Future<void> setBestServers() async {
    final settings = await tester.getSettings();
    final servers = settings.servers;

    final _bestServersList = await tester.getBestServers(
      servers: servers,
    );

    setState(() {
      bestServersList = _bestServersList;
      readyToTest = true;
    });
  }

  Future<void> _testDownloadSpeed() async {
    setState(() {
      loadingDownload = true;
    });
    final _downloadRate =
        await tester.testDownloadSpeed(servers: bestServersList);
    setState(() {
      downloadRate = _downloadRate;
      loadingDownload = false;
    });
  }

  Future<void> _testUploadSpeed() async {
    setState(() {
      loadingUpload = true;
    });

    final _uploadRate = await tester.testUploadSpeed(servers: bestServersList);

    setState(() {
      uploadRate = _uploadRate;
      loadingUpload = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setBestServers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
          title: Text("Speed Test",
         style: TextStyle(fontSize: 30*fontMultiplier, fontFamily: 'ProductSansBold', color: Colors.white))
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Download Test:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (loadingDownload)
                Column(
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Testing download speed...', style: TextStyle(color: Colors.white),),
                  ],
                )
              else
                Text('Download rate  ${downloadRate.toStringAsFixed(2)} Mb/s', style: TextStyle(color: Colors.white),),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: readyToTest && !loadingDownload
                      ? Colors.blue
                      : Colors.grey,
                ),
                onPressed: loadingDownload
                    ? null
                    : () async {
                        if (!readyToTest || bestServersList.isEmpty) return;
                        await _testDownloadSpeed();
                      },
                child: const Text('Start'),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Upload Test:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (loadingUpload)
                Column(
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Testing upload speed...', style: TextStyle(color: Colors.white),),
                  ],
                )
              else
                Text('Upload rate ${uploadRate.toStringAsFixed(2)} Mb/s', style: TextStyle(color: Colors.white),),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: readyToTest ? Colors.blue : Colors.grey,
                ),
                onPressed: loadingUpload
                    ? null
                    : () async {
                        if (!readyToTest || bestServersList.isEmpty) return;
                        await _testUploadSpeed();
                      },
                child: const Text('Start'),
              ),
            ],
          ),
        ),
      );
    
  }
}
