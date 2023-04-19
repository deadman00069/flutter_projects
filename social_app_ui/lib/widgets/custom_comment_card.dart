import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/theme/colors.dart';

import '../strings/strings.dart';

class CustomCommentCard extends StatelessWidget {
  const CustomCommentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.8.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(S.girlImage),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "maryjane",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "let’s do it again next week! 😎",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Like',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                            color: AppColors.textColor1,
                          ),
                        ),
                        Text(
                          '・Reply',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                            color: AppColors.textColor1,
                          ),
                        ),
                        Text(
                          '・Report',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                            color: AppColors.textColor1,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Text(
              '30m',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.textColor1),
            )
          ],
        ),
        SizedBox(
          height: 13.5.h,
        ),
        const Divider(
          color: AppColors.borderColor,
        )
      ],
    );
  }
}
