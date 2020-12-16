import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/providers/profile_provider.dart';
import 'package:heavy_bucket/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class TestItemScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var info = Provider.of<ProfileInfoProvider>(context);
    return  MaterialApp(
      home: Scaffold(backgroundColor: Colors.red,
        body: Center(
          child:Text(info.email),
        ),
      ),
    );
  }
}
