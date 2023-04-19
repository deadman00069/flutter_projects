import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:social_media_app/theme/colors.dart';

class CustomPinField extends StatelessWidget {
  const CustomPinField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        activeColor: AppColors.borderColor,
        inactiveFillColor: Colors.white,
        inactiveColor: AppColors.borderColor,
        selectedColor: AppColors.borderColor,
        selectedFillColor: Colors.white,
        shape: PinCodeFieldShape.circle,
        fieldHeight: 60.h,
        fieldWidth: 60.w,
        activeFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
        // setState(() {
        //   currentText = value;
        // });
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
      textStyle: Theme.of(context).textTheme.bodyText1,
      keyboardType: TextInputType.number,
      keyboardAppearance: Theme.of(context).brightness == Brightness.dark
          ? Brightness.dark
          : Brightness.light,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
