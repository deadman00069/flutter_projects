import 'package:get/get.dart';
import 'package:social_media_app/screens/intro/intro_screen_controller.dart';

class IntroScreenBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(IntroScreenController());
  }
}
