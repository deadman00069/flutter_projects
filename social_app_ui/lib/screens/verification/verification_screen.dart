import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_media_app/screens/feeds/feeds_screen.dart';
import 'package:social_media_app/screens/feeds/feeds_screen_2.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/colors.dart';
import 'package:social_media_app/widgets/custom_button.dart';
import 'package:social_media_app/widgets/custom_pin_field.dart';

class VerificationScreen extends StatelessWidget {
  static const id = '/VerificationScreen';

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: Theme.of(context).brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor1,
          ),
          onPressed: () {
            // Get.back();
            Get.isDarkMode
                ? Get.changeThemeMode(ThemeMode.light)
                : Get.changeThemeMode(ThemeMode.dark);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 42.h,
              child: Text(
                S.verification,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              height: 24.h,
              child: Text(
                S.weHaveSendVerificationCode,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.textColor1,
                    ),
              ),
            ),
            Text(
              'mandyportman@gmail.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 34.h,
            ),
            CustomPinField(),
            SizedBox(
              height: 51.h,
            ),
            CustomButton(
              text: S.verify,
              onPress: () {
                Get.toNamed(FeedsScreen2.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
