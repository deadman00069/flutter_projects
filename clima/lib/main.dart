import 'package:clima/screens/loadingscreen.dart';
import 'package:clima/screens/sample.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/sample.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
