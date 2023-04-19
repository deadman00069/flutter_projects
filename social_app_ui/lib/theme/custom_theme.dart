import 'package:flutter/material.dart';
import 'package:social_media_app/custom_text_style.dart';
import 'package:social_media_app/theme/colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        AppColors.primaryColor,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        width: 1.0,
        color: AppColors.textColor2,
        style: BorderStyle.solid,
      ),
      shape: const StadiumBorder(),
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.textColor1,
  ),
  textTheme: TextTheme(
    // 40
    displayLarge: CustomTextStyle.kTextStyle40Medium,
    // 28
    displayMedium: CustomTextStyle.kTextStyle28Medium
        .copyWith(color: AppColors.textColor2),
    // 20
    displaySmall: CustomTextStyle.kTextStyle20Medium,
    // 20
    headlineLarge: CustomTextStyle.kTextStyle20Regular,
    // 18
    headlineMedium: CustomTextStyle.kTextStyle18Medium.copyWith(
      color: AppColors.textColor2,
    ),
    // 15
    headlineSmall: CustomTextStyle.kTextStyle15Bold!.copyWith(
      color: AppColors.textColor2,

    ),
    // 15
    titleLarge: CustomTextStyle.kTextStyle15Regular.copyWith(
      color: AppColors.textColor2,
    ),
    // 14
    titleMedium: CustomTextStyle.kTextStyle14Medium,
    // 13
    titleSmall: CustomTextStyle.kTextStyle13SemiBold,
    // 13
    bodyLarge: CustomTextStyle.kTextStyle13Medium
        .copyWith(color: AppColors.textColor2),
    // 13
    bodyMedium: CustomTextStyle.kTextStyle13Regular.copyWith(
      color: AppColors.textColor2,
    ),
    // 12
    bodySmall: CustomTextStyle.kTextStyle12Regular
        .copyWith(color: AppColors.textColor2),
    // 11
    labelLarge: CustomTextStyle.kTextStyle11Medium,
    // 11
    labelMedium: CustomTextStyle.kTextStyle11Regular,
    // 10
    labelSmall: CustomTextStyle.kTextStyle10Regular,
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.textColor2,
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 1.0,
          color: Colors.white,
          style: BorderStyle.solid,
        ),
        shape: const StadiumBorder()),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: TextTheme(
    // 40
    displayLarge: CustomTextStyle.kTextStyle40Medium,
    // 28
    displayMedium: CustomTextStyle.kTextStyle28Medium.copyWith(
      color: Colors.white,
    ),
    // 20
    displaySmall: CustomTextStyle.kTextStyle20Medium,
    // 20
    headlineLarge: CustomTextStyle.kTextStyle20Regular,
    // 18
    headlineMedium: CustomTextStyle.kTextStyle18Medium.copyWith(
      color: Colors.white,
    ),
    // 15
    headlineSmall: CustomTextStyle.kTextStyle15Bold,
    // 15
    titleLarge: CustomTextStyle.kTextStyle15Regular.copyWith(
      color: Colors.white,
    ),
    // 14
    titleMedium: CustomTextStyle.kTextStyle14Medium,
    // 13
    titleSmall: CustomTextStyle.kTextStyle13SemiBold,
    // 13
    bodyLarge: CustomTextStyle.kTextStyle13Medium.copyWith(
      color: Colors.white,
    ),
    // 13
    bodyMedium: CustomTextStyle.kTextStyle13Regular.copyWith(
      color: Colors.white,
    ),
    // 12
    bodySmall: CustomTextStyle.kTextStyle12Regular.copyWith(
      color: Colors.white,
    ),
    // 11
    labelLarge: CustomTextStyle.kTextStyle11Medium,
    // 11
    labelMedium: CustomTextStyle.kTextStyle11Regular,
    // 10
    labelSmall: CustomTextStyle.kTextStyle10Regular,
  ),
);
