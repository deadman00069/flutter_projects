import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/screens/sign_up/sign_up_screen.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/colors.dart';
import 'package:social_media_app/widgets/custom_button.dart';

class IntroStartingScreen extends StatelessWidget {
  const IntroStartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/img_1.png',
              width: 299.w,
              height: 339.h,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 64.h,
            ),
            SizedBox(
              width: 279.w,
              child: Text(
                S.theSimplestWayToShare,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            SizedBox(
              height: 52.h,
            ),
            SizedBox(
              width: 183.w,
              child: CustomButton(
                text: S.getStarted,
                onPress: () {
                  Get.toNamed(SignUpScreen.id);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
