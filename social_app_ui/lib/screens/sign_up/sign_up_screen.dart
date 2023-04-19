import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/screens/login/login_screen.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/colors.dart';
import 'package:social_media_app/widgets/custom_button.dart';
import 'package:social_media_app/widgets/custom_icon_outlinedbutton.dart';
import 'package:social_media_app/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  static const id = '/SignUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

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
        child: SafeArea(
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.signUp,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 29.h,
                ),
               const CustomTextField(
                  label: S.yourEmail,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: CustomTextField(
                        label: S.firstName,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const Expanded(
                      child: CustomTextField(
                        label: S.lastName,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CustomTextField(
                  label: S.phone,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CustomTextField(
                  label: S.password,
                ),
                SizedBox(
                  height: 21.h,
                ),
                Center(
                  child: SizedBox(
                    width: 272.w,
                    height: 36.h,
                    child: Text(
                      S.bySigningUpYouAgree,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.textColor1,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 320.w,
                  child: const CustomButton(text: S.signUp),
                ),
                SizedBox(
                  height: 27.h,
                ),
                Center(
                  child: Text(
                    S.orSingUpWithSocial,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 27.h,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: CustomIconOutlinedButton(
                        icon: Icons.facebook,
                        text: S.facebook,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const Expanded(
                      child: CustomIconOutlinedButton(
                        icon: Icons.facebook,
                        text: S.twitter,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 83.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(LoginScreen.id);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: S.alreadyHaveAccount,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.textColor1),
                        children: [
                          TextSpan(
                            text: ' Log in',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 63.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
