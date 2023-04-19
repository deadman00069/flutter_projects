import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin Dimens {
  static double zero = 0.sp;
  static double pointOne = 0.1.sp;
  static double pointTwo = 0.2.sp;
  static double pointThree = 0.3.sp;
  static double pointFour = 0.4.sp;
  static double pointFive = 0.5.sp;
  static double one = 1.sp;
  static double two = 2.sp;
  static double three = 3.sp;
  static double four = 4.sp;
  static double five = 5.sp;
  static double six = 6.sp;
  static double seven = 7.sp;
  static double eight = 8.sp;
  static double nine = 9.sp;
  static double ten = 10.sp;
  static double twenty = 20.sp;
  static double thirty = 30.sp;
  static double fourty = 40.sp;
  static double fifty = 50.sp;
  static double sixty = 60.sp;
  static double seventy = 70.sp;
  static double eighty = 80.sp;
  static double ninety = 90.sp;
  static double hundred = 100.sp;
  static double twoHundred = 200.sp;

  /// Get the height with the percent value of the screen height.
  static double h(double percentValue) => (percentValue / 100).sh;

  /// Get the width with the percent value of the screen width.
  static double w(double percentValue) => (percentValue / 100).sw;

  static EdgeInsets getEdgeInsets(
      double left,
      double top,
      double right,
      double bottom,
      ) =>
      EdgeInsets.fromLTRB(
        left,
        top,
        right,
        bottom,
      );

  static const EdgeInsets edgeInsets0 = EdgeInsets.zero;

  static const SizedBox box0 = SizedBox.shrink();
}