import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/theme/colors.dart';

class FeedScreen extends StatelessWidget {
  static const id = '/FeedScreen';

  const FeedScreen({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: AppColors.textColor1,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 19),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16.r,
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Mandy Portman',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                '30 mins ago',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: AppColors.textColor1,
                                    ),
                              )
                            ],
                          )
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Following',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: AppColors.textColor1,
                                  ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 1.0,
                            color: AppColors.borderColorLight,
                            style: BorderStyle.solid,
                          ),
                          shape: const StadiumBorder(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                SizedBox(
                  height: 410.h,
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 320.w,
                      height: 390.h,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite_border),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            '24',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          const Icon(Icons.chat_bubble_outline_outlined),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            '32',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          const Icon(Icons.remove_red_eye_outlined),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            '680',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      const Icon(Icons.bookmark_border),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
