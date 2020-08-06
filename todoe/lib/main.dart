import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/first_screen.dart';
import 'package:todoe/model/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: StartingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
