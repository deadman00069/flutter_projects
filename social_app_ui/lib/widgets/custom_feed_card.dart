import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFeedCard extends StatelessWidget {
  const CustomFeedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    Text(
                      'Mandy Portman',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          SizedBox(
            height: 410.h,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 28),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(right: 15),
                child: UnconstrainedBox(
                  alignment: Alignment.topLeft,
                  child: PhysicalModel(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xff707070),
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
              ),
              itemCount: 5,
              physics: const BouncingScrollPhysics(),
            ),
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
    );
  }
}
