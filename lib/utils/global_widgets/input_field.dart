import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class InputField extends StatelessWidget {
  InputField(
      {Key? key,
      this.suffixIcon,
      this.obscureText = false,
      this.hintText,
      this.onChanged,
      this.inputFormatters,
      this.errorMessage = ''})
      : super(key: key);
  final String? hintText;
  Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String errorMessage;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      maxLines: 1,
      obscureText: obscureText,
      textAlign: TextAlign.left,
      style: Styles.semibold12pxTextStyle(color: AppColors.focusedTextColor),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: hintText,
        hintStyle:
            Styles.semibold12pxTextStyle(color: AppColors.greyHintTextColor),
        focusedBorder: foucuedBorder(context),
        enabledBorder: enabledBorder(context),
        errorBorder: enabledBorder(context),
        border: enabledBorder(context),
        errorText: errorMessage.isEmpty ? null : errorMessage,
      ),
    );
  }

  enabledBorder(BuildContext context) => OutlineInputBorder(
      borderSide:
          BorderSide(color: AppColors.greyHintTextColor.withOpacity(0.2)),
      borderRadius: BorderRadius.circular(25.0));

  foucuedBorder(BuildContext context) => OutlineInputBorder(
      borderSide:
          BorderSide(color: AppColors.greyHintTextColor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(25.0));
}
