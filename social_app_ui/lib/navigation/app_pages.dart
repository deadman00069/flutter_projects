import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:social_media_app/screens/comments/comment_screen.dart';
import 'package:social_media_app/screens/create_post/create_post_screen.dart';
import 'package:social_media_app/screens/feeds/feeds_screen.dart';
import 'package:social_media_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:social_media_app/screens/intro/intro_screen.dart';
import 'package:social_media_app/screens/intro/intro_screen_bindings.dart';
import 'package:social_media_app/screens/login/login_screen.dart';
import 'package:social_media_app/screens/sign_up/sign_up_screen.dart';
import 'package:social_media_app/screens/splash_screen/splash_screen.dart';
import 'package:social_media_app/screens/splash_screen/splash_screen_bindings.dart';
import 'package:social_media_app/screens/verification/verification_screen.dart';

import '../screens/feeds/feeds_screen_2.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: SplashScreen.id,
      page: () => const SplashScreen(),
      binding: SplashScreenBindings(),
    ),
    GetPage(
      name: IntroScreen.id,
      page: () => const IntroScreen(),
      binding: IntroScreenBindings(),
    ),
    GetPage(
      name: SignUpScreen.id,
      page: () => const SignUpScreen(),
      // binding: IntroScreenBindings(),
    ),
    GetPage(
      name: LoginScreen.id,
      page: () => const LoginScreen(),
      // binding: IntroScreenBindings(),
    ),
    GetPage(
      name: ForgotPasswordScreen.id,
      page: () => const ForgotPasswordScreen(),
      // binding: IntroScreenBindings(),
    ),
    GetPage(
      name: VerificationScreen.id,
      page: () => const VerificationScreen(),
      // binding: IntroScreenBindings(),
    ),
    GetPage(
      name: CommentScreen.id,
      page: () => const CommentScreen(),
      // binding: IntroScreenBindings(),
    ),
    GetPage(
      name: FeedsScreen.id,
      page: () => const FeedsScreen(),
      // binding: IntroScreenBindings(),
    ),
    GetPage(
      name: FeedsScreen2.id,
      page: () => const FeedsScreen2(),
      // binding: IntroScreenBindings(),
    ),
    GetPage(
      name: CreatePostScreen.id,
      page: () => const CreatePostScreen(),
      // binding: IntroScreenBindings(),
    ),
  ];
}
