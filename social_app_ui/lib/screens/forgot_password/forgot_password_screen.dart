import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/colors.dart';
import 'package:social_media_app/widgets/custom_button.dart';
import 'package:social_media_app/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const id = '/ForgotPasswordScreen';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  S.forgotPassword,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            Text(
              S.pleaseEnterYourEmailToReceive,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.textColor1,
                  ),
            ),
            SizedBox(
              height: 39.h,
            ),
            const CustomTextField(label: S.yourEmail),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              width: 320.w,
              child: const CustomButton(text: S.sendMeNow),
            )
          ],
        ),
      ),
    );
  }
}
