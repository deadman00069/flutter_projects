import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:social_media_app/screens/sign_up/sign_up_screen.dart';
import 'package:social_media_app/screens/verification/verification_screen.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/colors.dart';
import 'package:social_media_app/widgets/custom_button.dart';
import 'package:social_media_app/widgets/custom_icon_outlinedbutton.dart';
import 'package:social_media_app/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  static const id = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    S.login,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 33.h,
              ),
              const CustomTextField(label: S.yourEmail),
              SizedBox(
                height: 16.h,
              ),
              const CustomTextField(label: S.password),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(ForgotPasswordScreen.id);
                    },
                    child: Text(
                      S.forgotPassword,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              SizedBox(
                width: 320.w,
                child: CustomButton(
                  text: S.login,
                  onPress: () {
                    Get.toNamed(VerificationScreen.id);
                  },
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Text(
                S.orLoginWithSocialAccounts,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 25.h,
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
                height: 223.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(SignUpScreen.id);
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
                          text: ' ' + S.signUp,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 63.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
