import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/models/intro_model.dart';
import 'package:social_media_app/screens/intro/intro_screen_controller.dart';
import 'package:social_media_app/screens/intro/intro_starting_screen.dart';
import 'package:social_media_app/theme/colors.dart';
import 'package:social_media_app/widgets/custom_intro_bubbles.dart';
import 'package:social_media_app/widgets/custom_intro_slide.dart';

import '../../strings/strings.dart';

class IntroScreen extends StatelessWidget {
  static const id = '/IntroScreen';

  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IntroScreenController controller = Get.find();
    return Obx(
      () => Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              itemBuilder: (_, index) {
                List<IntroModel> intros = [
                  IntroModel(
                    S.meetNewFriendsNearby,
                    S.theMostFunWayToMeet,
                    'assets/img_2.png',
                    AppColors.backgroundColor2,
                  ),
                  IntroModel(
                    S.haveFunWithNewFriends,
                    S.theMostFunWayToShare,
                    'assets/img_3.png',
                    AppColors.backgroundColor1,
                  ),
                  IntroModel(
                    S.shareYourHappyMoment,
                    S.createStoriesFromYourFavouriteMemories,
                    'assets/img_4.png',
                    AppColors.backgroundColor2,
                  ),
                ];
                return index == 0
                    // || controller.currentIndex.value == 3
                    ? const IntroStartingScreen()
                    : Center(
                        child: CustomIntroSlide(
                          intro: intros[index - 1],
                        ),
                      );
              },
              itemCount: 4,
              allowImplicitScrolling: true,
              physics: const BouncingScrollPhysics(),
              scrollBehavior: const CupertinoScrollBehavior(),
              onPageChanged: (i) {
                controller.currentIndex.value = i;
              },
            ),
            Align(
              alignment: const Alignment(0, 0.95),
              child: controller.currentIndex.value == 0
                  ? const SizedBox()
                  : CustomIntroBubbles(
                      index: controller.currentIndex.value,
                    ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: controller.currentIndex.value == 0
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 32, right: 18),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          S.login,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
