import 'package:flutter/material.dart';
import 'package:insta_clone/screens/camera.dart';
import 'package:insta_clone/screens/send_message_screen.dart';
import 'package:insta_clone/screens/start.dart';

class MyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            CameraScreen(),
            BottomNav(),
            SendMessageScreen(),
          ],
        ),
      ),
    );
  }
}
