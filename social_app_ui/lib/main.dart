import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/screens/comments/comment_screen.dart';
import 'package:social_media_app/screens/create_post/create_post_screen.dart';
import 'package:social_media_app/screens/feed/feed_screen.dart';
import 'package:social_media_app/screens/feeds/feeds_screen.dart';
import 'package:social_media_app/screens/feeds/feeds_screen_2.dart';
import 'package:social_media_app/screens/splash_screen/splash_screen.dart';
import 'package:social_media_app/screens/test_screen.dart';
import 'package:social_media_app/theme/custom_theme.dart';

import 'navigation/app_pages.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: (const Size(375, 812)),
      builder: (_) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: true,
        theme: lightTheme,
        // Light theme
        darkTheme: darkTheme,
        //// Dark Theme
        themeMode: ThemeMode.system,
        home: CommentScreen(),
        // initialRoute: SplashScreen.id,
        // getPages: AppPages.pages,
      ),
    );
  }
}
