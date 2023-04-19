import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/theme/colors.dart';

class CustomIntroBubble extends StatelessWidget {
  final int index;
  final int number;
  final Color color;

  const CustomIntroBubble({
    Key? key,
    required this.index,
    required this.number,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index == number
        ? CircleAvatar(
            radius: 6.r,
            backgroundColor: Colors.white,
            // backgroundColor: index == number
            //     ? Theme.of(context).primaryColor
            //     : Theme.of(context).secondaryHeaderColor,
            child: CircleAvatar(
              radius: 4.5.r,
              backgroundColor: color,
              child: CircleAvatar(
                radius: 3.r,
                backgroundColor: Colors.white,
              ),
            ),
          )
        : CircleAvatar(
            radius: 6.r,
            backgroundColor: Colors.white,
          );
  }
}
