import 'package:get/get.dart';
import 'package:social_media_app/screens/splash_screen/splash_screen_controller.dart';

class SplashScreenBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashScreenController());
  }
}
