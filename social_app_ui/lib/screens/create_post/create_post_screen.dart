import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/colors.dart';

class CreatePostScreen extends StatelessWidget {
  static const id = '/CreatePostScreen';

  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: Theme.of(context).brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.isDarkMode
                ? Get.changeThemeMode(ThemeMode.light)
                : Get.changeThemeMode(ThemeMode.dark);
          },
        ),
        title: Text(
          S.createPost,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Share',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 18.25.h),
                hintText: S.startWriting,
                hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.textColor1,
                    ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColorLight),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColorLight),
                ),
              ),
              maxLines: null,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 25.75.h,
            ),
            Wrap(
              spacing: 10.w,
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? AppColors.color363636
                        : AppColors.colorf6f6f6,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
