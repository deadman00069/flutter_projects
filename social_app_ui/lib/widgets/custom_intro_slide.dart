import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/models/intro_model.dart';
import 'package:social_media_app/screens/sign_up/sign_up_screen.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/colors.dart';
import 'package:social_media_app/widgets/custom_button.dart';

class CustomIntroSlide extends StatelessWidget {
  final IntroModel intro;

  const CustomIntroSlide({Key? key, required this.intro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: intro.backGroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 75.h,
          ),
          Image.asset(
            intro.imUrl,
            width: 300.w,
            height: 334.h,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 51.h,
          ),
          SizedBox(
            width: 285.w,
            child: Text(
              intro.heading,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 14.h),
          SizedBox(
            width: 266.w,
            height: 51.h,
            child: Text(
              intro.text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 27.h,
          ),
          SizedBox(
            width: 286.w,
            child: CustomButton(
              text: S.getStarted,
              color: intro.backGroundColor == AppColors.backgroundColor2
                  ? AppColors.backgroundColor1
                  : null,
              onPress: () {
                Get.toNamed(SignUpScreen.id);
              },
            ),
          )
        ],
      ),
    );
  }
}
