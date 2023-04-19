import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/screens/splash_screen/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  static const id = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.find();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Splash Screen',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
