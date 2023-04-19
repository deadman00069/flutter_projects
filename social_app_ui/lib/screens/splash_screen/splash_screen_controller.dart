import 'package:get/get.dart';
import 'package:social_media_app/screens/intro/intro_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    goToNextScreen();
  }

  void goToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(IntroScreen.id);
  }
}
