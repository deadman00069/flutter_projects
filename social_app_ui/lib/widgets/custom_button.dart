import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:social_media_app/custom_text_style.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final Callback? onPress;

  const CustomButton({Key? key, this.color, required this.text, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          if (onPress != null) {
            onPress!.call();
          }
        },
        child: Text(
          text,
          style: CustomTextStyle.kTextStyle15Regular.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
