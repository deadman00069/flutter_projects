import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/colors.dart';
import 'package:social_media_app/widgets/custom_comment_card.dart';

class CommentScreen extends StatelessWidget {
  static const id = '/CommentScreen';

  const CommentScreen({Key? key}) : super(key: key);

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
            color: AppColors.textColor1,
          ),
          onPressed: () {
            Get.isDarkMode
                ? Get.changeThemeMode(ThemeMode.light)
                : Get.changeThemeMode(ThemeMode.dark);
          },
        ),
        title: Text(
          S.comments,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              RichText(
                text: TextSpan(
                  text: 'mandypo  ',
                  children: [
                    TextSpan(
                      text:
                          "Its been a very wonderful time on the west beach today. Best day ever, thanks!😍,",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: '  @maryjane',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Color(0xffEF5858)),
                    )
                  ],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Text(
                '#summertime #beachlife ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 13.3.h,
              ),
              const Divider(
                color: AppColors.borderColor,
              ),
              const CustomCommentCard(),
              const CustomCommentCard(),
              const CustomCommentCard(),
              const CustomCommentCard(),
            ],
          ),
        ),
      ),
    );
  }
}
