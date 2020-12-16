import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/opt_screen.dart';
import 'package:heavy_bucket/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = 'WelcomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage('assets/images/crane_2.png'),
            ),
            Text(
              'Convenient Use',
              textAlign: TextAlign.center,
              style: kStyle1,
            ),
            Text(
              'Dribbble is where designers gain inspiration, feedback, community, and books.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
            CustomButton(
                text: 'Get Started',
                color: Color(0xffFFCE33),
                function: () {
                  Navigator.pushNamed(context, OtpScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
