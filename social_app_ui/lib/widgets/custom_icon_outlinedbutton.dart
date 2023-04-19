import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconOutlinedButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomIconOutlinedButton(
      {Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
        ),
        label: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
