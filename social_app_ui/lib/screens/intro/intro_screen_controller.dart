import 'package:get/get.dart';

class IntroScreenController extends GetxController {
  var currentIndex = 0.obs;
  var loading = false.obs;

  // @override
  // void onInit() async {
  //   // TODO: implement onInit
  //   super.onInit();
  //   loading.value = true;
  //   _preferences = await SharedPreferences.getInstance();
  //   checkIfCompleteIntroSlide();
  // }

  // void isCompleteIntroSlide() async {
  //   _preferences.setBool('is_complete_intro_slide', true);
  // }

  // void checkIfCompleteIntroSlide() async {
  //   bool? isCompleted = _preferences.getBool('is_complete_intro_slide');
  //   String? token = _preferences.getString('token');
  //   if (isCompleted != null && isCompleted) {
  //     if (token != null && token.isNotEmpty) {
  //       Get.toNamed(BottomNavScreen.id);
  //     } else {
  //       Get.toNamed(SignupLoginScreen.id);
  //     }
  //   } else {
  //     loading.value = false;
  //   }
  // }
}
