import 'package:flutter/material.dart';
import 'package:social_media_app/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (v) {
        // if (v!.isEmpty) return "THis field is reqired";
        // if (!v.isNumericOnly) return "THis field iascsds reqired";
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        label: Text(
          label,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.textColor1,
              ),
        ),
        contentPadding: const EdgeInsets.only(bottom: 8),
        // contentPadding: EdgeInsets.all(0),
      ),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
