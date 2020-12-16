import 'package:animated_splash/animated_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/screens/bottom_tab_screen.dart';
import 'package:heavy_bucket/screens/fetching_user_details.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/welcome_screen.dart';
class SplashScreen extends StatelessWidget {
  static const id = 'SplashScreen';
  final user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: 'assets/images/logo.jpg',
      home: user != null ? FetchingUserScreen(): WelcomeScreen(),
      duration: 2500,
      type: AnimatedSplashType.StaticDuration,
    );
  }
}

