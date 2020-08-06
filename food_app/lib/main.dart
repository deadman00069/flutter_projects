import 'package:flutter/material.dart';
import 'package:food_app/screen/first_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: FirstScreen(),
    );
  }
}
