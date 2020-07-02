import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white
      ),
      home: InputPage(),
    );
  }
}


