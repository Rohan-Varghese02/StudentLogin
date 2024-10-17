import 'package:app1/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const SAVE_KEY_NAME = 'UserLoggIn';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff03E079),
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splashscreen(),
    );
  }
}
