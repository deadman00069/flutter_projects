// 10 regular
// 11 regular medium
// 12 regular
// 13 regular medium semi-bold
// 14 medium
// 15 regular bold
// 18 medium
// 20 regular medium
// 28 medium
// 40 medium

import 'package:flutter/cupertino.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/theme/dimes.dart';

mixin CustomTextStyle {
  static TextStyle kTextStyle10Regular = TextStyle(
    fontSize: Dimens.ten,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w400,
  );

  static TextStyle kTextStyle11Regular = TextStyle(
    fontSize: Dimens.ten + Dimens.one,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w400,
  );

  static TextStyle kTextStyle11Medium = TextStyle(
    fontSize: Dimens.ten + Dimens.one,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kTextStyle12Regular = TextStyle(
    fontSize: Dimens.ten + Dimens.two,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle kTextStyle13Regular = TextStyle(
    fontSize: Dimens.ten + Dimens.three,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle kTextStyle13Medium = TextStyle(
    fontSize: Dimens.ten + Dimens.three,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kTextStyle13SemiBold = TextStyle(
    fontSize: Dimens.ten + Dimens.three,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle kTextStyle14Medium = TextStyle(
    fontSize: Dimens.ten + Dimens.four,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kTextStyle15Regular = TextStyle(
    fontSize: Dimens.ten + Dimens.five,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle kTextStyle15Bold = TextStyle(
    fontSize: Dimens.ten + Dimens.five,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w700,
  );
  static TextStyle kTextStyle18Medium = TextStyle(
    fontSize: Dimens.ten + Dimens.eight,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kTextStyle20Regular = TextStyle(
    fontSize: Dimens.twenty,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kTextStyle20Medium = TextStyle(
    fontSize: Dimens.twenty,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kTextStyle28Medium = TextStyle(
    fontSize: Dimens.twenty + Dimens.eight,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kTextStyle40Medium = TextStyle(
    fontSize: Dimens.fourty,
    fontFamily: S.fontFamily,
    fontWeight: FontWeight.w500,

  );
}
