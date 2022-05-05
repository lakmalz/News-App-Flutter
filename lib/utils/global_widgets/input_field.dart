import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class InputField extends StatelessWidget {
   InputField({Key? key, this.hintText}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: textEditingController,
        maxLines: 1,
        textAlign: TextAlign.left,
        style: Styles.semibold12pxTextStyle(AppColors.focusedTextColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: hintText,
          hintStyle: Styles.semibold12pxTextStyle(AppColors.greyHintTextColor),
          focusedBorder: foucuedBorder(context),
          enabledBorder: enabledBorder(context),
          border: enabledBorder(context),
        ),
      ),
    );
  }

   enabledBorder(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyHintTextColor.withOpacity(0.2)),
      borderRadius: BorderRadius.circular(25.0));

  foucuedBorder(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyHintTextColor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(25.0));
}