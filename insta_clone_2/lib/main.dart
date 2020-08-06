import 'package:flutter/material.dart';
import 'package:insta_clone/screens/start.dart';
import 'package:insta_clone/screens/search_screen.dart';
import 'package:insta_clone/screens/tab_view.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyTab()
    );
  }
}
